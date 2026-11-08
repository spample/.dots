-- Small, offline, Quickshell-aware blink.cmp source.
-- qmlls remains the authoritative completion source for Qt/QML symbols.
local Source = {}
Source.__index = Source

local K = vim.lsp.protocol.CompletionItemKind

local modules = {
  'Quickshell', 'Quickshell.Hyprland', 'Quickshell.Io',
  'Quickshell.Widgets', 'Quickshell.Wayland', 'Quickshell.Bluetooth',
  'Quickshell.Networking', -- Quickshell 0.3+, may not exist on older installs
  'Quickshell.Services.Pipewire', 'Quickshell.Services.UPower',
  'Quickshell.Services.SystemTray', 'Quickshell.Services.Mpris',
  'Quickshell.Services.Notifications', 'Quickshell.Services.PowerProfiles',
}

-- Only suggest components where their module appears in the buffer's imports.
local components = {
  Quickshell = { 'ShellRoot', 'PanelWindow', 'PopupWindow', 'FloatingWindow',
    'Scope', 'Variants', 'SystemClock', 'LazyLoader', 'PersistentProperties',
    'Singleton', 'ObjectRepeater', 'QsMenuAnchor' },
  ['Quickshell.Io'] = { 'Process', 'StdioCollector', 'FileView', 'FileWatcher', 'Socket' },
  ['Quickshell.Widgets'] = { 'IconImage', 'ClippingRectangle', 'WrapperItem', 'WrapperRectangle' },
  ['Quickshell.Services.Pipewire'] = { 'PwObjectTracker', 'PwNodeLinkTracker' },
}

-- Context-specific singleton member hints. These are suggestions, not a type checker.
local members = {
  Hyprland = { 'workspaces', 'focusedWorkspace', 'activeToplevel', 'toplevels',
    'monitors', 'focusedMonitor', 'dispatch', 'message' },
  Pipewire = { 'defaultAudioSink', 'defaultAudioSource', 'preferredDefaultAudioSink',
    'preferredDefaultAudioSource', 'nodes', 'ready' },
  UPower = { 'displayDevice', 'devices', 'onBattery' },
  SystemTray = { 'items' },
  Mpris = { 'players' },
  Quickshell = { 'screens', 'workingDirectory', 'cacheDir' },
  SystemClock = { 'hours', 'minutes', 'seconds', 'date' },
}

local descriptions = {
  PanelWindow = 'Edge-anchored panel window for status bars and docks.',
  ShellRoot = 'Root of a Quickshell configuration.',
  Variants = 'Instantiate one component for every model entry (for example monitors).',
  Process = 'Start and communicate with an external process.',
  PwObjectTracker = 'Track PipeWire objects so their properties stay updated.',
  activeToplevel = 'Current active Hyprland toplevel (may be null).',
  workspaces = 'Workspace model from Hyprland.',
  defaultAudioSink = 'Current PipeWire output device (may temporarily be null).',
  displayDevice = 'UPower aggregate device for battery information.',
}

local function make_item(label, kind, detail, insert_text)
  return {
    label = label,
    kind = kind,
    detail = detail,
    insertText = insert_text or label,
    documentation = { kind = 'markdown', value = descriptions[label] or detail },
  }
end

local function imported_modules(bufnr)
  local imported = {}
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  for _, line in ipairs(lines) do
    local module = line:match('^%s*import%s+([%w%.]+)')
    if module then imported[module] = true end
  end
  return imported
end

local function is_usable_import(module, imported)
  return imported[module] or (module == 'Quickshell' and imported.Quickshell)
end

function Source.new(opts)
  return setmetatable({ opts = opts or {} }, Source)
end

function Source:enabled()
  return vim.bo.filetype == 'qml'
end

function Source:get_trigger_characters()
  return { '.' }
end

function Source:get_completions(ctx, callback)
  local bufnr = ctx.bufnr or vim.api.nvim_get_current_buf()
  local cursor = ctx.get_pos and ctx.get_pos() or nil
  local line = ctx.line or vim.api.nvim_get_current_line()
  local col = cursor and cursor.col or vim.api.nvim_win_get_cursor(0)[2]
  local before = line:sub(1, col)
  local items = {}

  if before:match('^%s*import%s+[%w%.]*$') then
    local typed = before:match('^%s*import%s+([%w%.]*)$') or ''
    local prefix = typed:match('^(.*%.)') or ''
    for _, name in ipairs(modules) do
      if name:sub(1, #prefix) == prefix then
        local suffix = name:sub(#prefix + 1)
        if suffix ~= '' and not suffix:find('%.') then
          items[#items + 1] = make_item(suffix, K.Module, 'import ' .. name)
        end
      end
    end
  else
    local namespace = before:match('([%a_][%w_]*)%.[%w_]*$')
    if namespace and members[namespace] then
      for _, name in ipairs(members[namespace]) do
        items[#items + 1] = make_item(name, K.Property, namespace .. ' member')
      end
    elseif not namespace and before:match('^%s*[%a_]*$') then
      local imported = imported_modules(bufnr)
      for module, names in pairs(components) do
        if is_usable_import(module, imported) then
          for _, name in ipairs(names) do
            items[#items + 1] = make_item(name, K.Class, module .. ' component')
          end
        end
      end
    end
  end

  callback({ items = items, is_incomplete_forward = false, is_incomplete_backward = false })
  return function() end
end

return Source

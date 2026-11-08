-- LSP, Mason tool installation, and C/C++ IDE mappings.

vim.pack.add {
  'https://github.com/j-hui/fidget.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
}

require('fidget').setup {}
require('mason').setup {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, blink = pcall(require, 'blink.cmp')
if ok then capabilities = blink.get_lsp_capabilities(capabilities) end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('custom-lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, {
        buffer = event.buf,
        desc = 'LSP: ' .. desc,
      })
    end

    map('gd', vim.lsp.buf.definition, 'Goto Definition')
    map('gD', vim.lsp.buf.declaration, 'Goto Declaration')
    map('gr', vim.lsp.buf.references, 'References')
    map('K', vim.lsp.buf.hover, 'Hover Documentation')
    map('<F2>', vim.lsp.buf.rename, 'Rename Symbol')
    map('grn', vim.lsp.buf.rename, 'Rename Symbol')
    map('<A-CR>', vim.lsp.buf.code_action, 'Code Action', { 'n', 'x' })
    map('gra', vim.lsp.buf.code_action, 'Code Action', { 'n', 'x' })
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
    map('<leader>cr', vim.lsp.buf.rename, '[C]ode [R]ename')
    map('<leader>ci', vim.lsp.buf.incoming_calls, '[C]alls [I]ncoming')
    map('<leader>co', vim.lsp.buf.outgoing_calls, '[C]alls [O]utgoing')

    local client = vim.lsp.get_client_by_id(event.data.client_id)

    if client and client.name == 'clangd' then
      map('<leader>ch', '<cmd>LspClangdSwitchSourceHeader<CR>', '[C]++ Source/[H]eader')
      map('<leader>cs', '<cmd>LspClangdShowSymbolInfo<CR>', '[C]langd [S]ymbol Info')
    end

    if client and client:supports_method('textDocument/documentHighlight', event.buf) then
      local group = vim.api.nvim_create_augroup('custom-lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = group,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = group,
        callback = vim.lsp.buf.clear_references,
      })
    end

    if client and client:supports_method('textDocument/inlayHint', event.buf) then
      map(
        '<leader>th',
        function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }, { bufnr = event.buf }) end,
        'Toggle Inlay Hints'
      )
    end
  end,
})

local servers = {
  clangd = {
    cmd = {
      vim.fn.expand '$HOME' .. '/.local/share/nvim/mason/bin/clangd',
      '--background-index',
      '--clang-tidy',
      '--completion-style=detailed',
      '--header-insertion=iwyu',
    },
    root_markers = {
      '.clangd',
      '.clang-tidy',
      '.clang-format',
      'compile_commands.json',
      'compile_flags.txt',
      'CMakeLists.txt',
      'Makefile',
      'makefile',
      'platformio.ini',
      '.git',
    },
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
      clangdFileStatus = true,
    },
  },

  qmlls = {
    cmd = { '/usr/lib/qt6/bin/qmlls' },

    filetypes = { 'qml', 'qmljs' },

    root_dir = function(bufnr, on_dir)
      local filename = vim.api.nvim_buf_get_name(bufnr)

      local root = vim.fs.root(filename, {
        '.qmlls.ini',
        'shell.qml',
      })

      on_dir(root or vim.fn.getcwd())
    end,
  },
  gopls = {},
  html = { filetypes = { 'html', 'twig', 'hbs' } },
  cssls = {},
  dockerls = {},
  jsonls = {},
  yamlls = {},
  lua_ls = {
    on_init = function(client)
      client.server_capabilities.documentFormattingProvider = false
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if path ~= vim.fn.stdpath 'config' and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then return end
      end
      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          version = 'LuaJIT',
          path = { 'lua/?.lua', 'lua/?/init.lua' },
        },
        workspace = {
          checkThirdParty = false,
          library = vim.tbl_extend('force', vim.api.nvim_get_runtime_file('', true), {
            '${3rd}/luv/library',
            '${3rd}/busted/library',
          }),
        },
      })
    end,
    settings = { Lua = { format = { enable = false } } },
  },
}

local ensure_installed = {}

for name, _ in pairs(servers) do
  if name ~= 'qmlls' then table.insert(ensure_installed, name) end
end

vim.list_extend(ensure_installed, {
  'stylua',
  'clang-format',
  'codelldb',
})

require('mason-tool-installer').setup {
  ensure_installed = ensure_installed,
  auto_update = false,
  run_on_start = true,
}

for name, config in pairs(servers) do
  config.capabilities = capabilities
  vim.lsp.config(name, config)
  vim.lsp.enable(name)
end

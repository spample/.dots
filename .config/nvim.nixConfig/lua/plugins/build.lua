-- Plugin build hooks for vim.pack installs/updates.

-- Run a shell command and show a notification if it fails.
local function run_build(name, cmd, cwd)
  local result = vim.system(cmd, { cwd = cwd }):wait()
  if result.code ~= 0 then
    local stderr = result.stderr or ''
    local stdout = result.stdout or ''
    local output = stderr ~= '' and stderr or stdout
    if output == '' then
      output = 'No output from build command.'
    end
    vim.notify(("Build failed for %s: %s"):format(name, output), vim.log.levels.ERROR)
  end
end

-- Run plugin-specific build steps after vim.pack installs or updates a plugin.
vim.api.nvim_create_autocmd('PackChanged', {
  group = vim.api.nvim_create_augroup('pack-build-hooks', { clear = true }),
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind

    if kind ~= 'install' and kind ~= 'update' then
      return
    end

    -- Native Telescope sorter.
    if name == 'telescope-fzf-native.nvim' and vim.fn.executable('make') == 1 then
      run_build(name, { 'make' }, ev.data.path)
      return
    end

    -- Optional LuaSnip regex support.
    if name == 'LuaSnip' and vim.fn.has('win32') ~= 1 and vim.fn.executable('make') == 1 then
      run_build(name, { 'make', 'install_jsregexp' }, ev.data.path)
      return
    end

    -- Keep Treesitter parsers updated with the plugin.
    if name == 'nvim-treesitter' then
      if not ev.data.active then
        vim.cmd.packadd('nvim-treesitter')
      end
      vim.cmd('TSUpdate')
      return
    end

    -- markdown-preview.nvim needs its Node app installed.
    if name == 'markdown-preview.nvim' then
      local app_dir = vim.fs.joinpath(ev.data.path, 'app')
      if vim.uv.fs_stat(vim.fs.joinpath(app_dir, 'package.json')) and vim.fn.executable('npm') == 1 then
        run_build(name, { 'npm', 'install' }, app_dir)
      end
    end
  end,
})

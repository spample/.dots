-- UI/theme plugins and editor quality-of-life tools.

local gh = require('core.utils').gh

-- Install UI-related plugins.
vim.pack.add({
  gh('NMAC427/guess-indent.nvim'),
  gh('folke/which-key.nvim'),
  gh('folke/tokyonight.nvim'),
  gh('folke/todo-comments.nvim'),
  gh('nvim-lua/plenary.nvim'),
  gh('nvim-mini/mini.nvim'),
})

-- Auto-detect indentation from existing files.
require('guess-indent').setup({})

-- Which-key group labels and popup behavior.
require('which-key').setup({
  delay = 0,
  icons = { mappings = vim.g.have_nerd_font },
  spec = {
    { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
    { '<leader>t', group = '[T]oggle' },
    { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    { 'gr', group = 'LSP Actions', mode = { 'n' } },
  },
})

-- Colorscheme.
require('tokyonight').setup({
  styles = {
    comments = { italic = false },
  },
})
vim.cmd.colorscheme('tokyonight-night')

-- Highlight TODO/FIXME/etc. comments.
require('todo-comments').setup({ signs = false })

-- Mini.nvim modules.
if vim.g.have_nerd_font then
  require('mini.icons').setup()
  MiniIcons.mock_nvim_web_devicons()
end

require('mini.ai').setup({
  mappings = {
    around_next = 'aa',
    inside_next = 'ii',
  },
  n_lines = 500,
})

require('mini.surround').setup()

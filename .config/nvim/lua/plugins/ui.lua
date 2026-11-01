-- UI/theme plugins and editor quality-of-life tools.

local gh = require('core.utils').gh

vim.pack.add({
  gh('folke/which-key.nvim'),
  gh('folke/tokyonight.nvim'),
  gh('folke/todo-comments.nvim'),
  gh('nvim-lua/plenary.nvim'),
  gh('nvim-mini/mini.nvim'),
  gh('folke/trouble.nvim'),
})

require('which-key').setup({
  delay = 0,
  icons = { mappings = vim.g.have_nerd_font },
  spec = {
    { '<leader>b', group = '[B]uild' },
    { '<leader>c', group = '[C]ode / C++' },
    { '<leader>d', group = '[D]ebug' },
    { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
    { '<leader>t', group = '[T]oggle' },
    { '<leader>x', group = 'Diagnostics/Trouble' },
    { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    { 'gr', group = 'LSP Actions', mode = { 'n' } },
  },
})

require('tokyonight').setup({
  styles = { comments = { italic = false } },
})
vim.cmd.colorscheme('tokyonight-night')

require('todo-comments').setup({ signs = false })
require('trouble').setup({})

vim.keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<CR>', { desc = 'Diagnostics panel' })
vim.keymap.set('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Buffer diagnostics' })
vim.keymap.set('n', '<leader>xl', '<cmd>Trouble lsp toggle focus=false win.position=right<CR>', { desc = 'LSP definitions/references' })
vim.keymap.set('n', '<leader>xq', '<cmd>Trouble qflist toggle<CR>', { desc = 'Quickfix panel' })

if vim.g.have_nerd_font then
  require('mini.icons').setup()
  MiniIcons.mock_nvim_web_devicons()
end

require('mini.ai').setup({
  mappings = { around_next = 'aa', inside_next = 'ii' },
  n_lines = 500,
})
require('mini.surround').setup()

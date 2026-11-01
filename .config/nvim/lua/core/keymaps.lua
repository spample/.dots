-- General IDE-style keymaps that are not tied to one plugin.

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<C-s>', '<cmd>write<CR>', { desc = 'Save file' })
vim.keymap.set('i', '<C-s>', '<Esc><cmd>write<CR>a', { desc = 'Save file' })
vim.keymap.set('n', '<leader>w', '<cmd>write<CR>', { desc = '[W]rite file' })
vim.keymap.set('n', '<leader>qq', '<cmd>qa<CR>', { desc = '[Q]uit all' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostic [Q]uickfix list' })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = 'Next diagnostic' })
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = 'Previous diagnostic' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Focus left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Focus right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Focus lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Focus upper window' })

vim.keymap.set({ 'n', 'v' }, 'd', '"_d')
vim.keymap.set({ 'n', 'v' }, 'c', '"_c')
vim.keymap.set('x', 'p', '"_dP', opts)

vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move block down' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move block up' })

vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<C-y>', 'copilot#Accept("<CR>")', {
  expr = true,
  silent = true,
  replace_keycodes = false,
  desc = 'Accept Copilot suggestion',
})

vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', { desc = 'Toggle line wrap' })
vim.keymap.set('n', ']b', '<cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '[b', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = '[B]uffer [D]elete' })

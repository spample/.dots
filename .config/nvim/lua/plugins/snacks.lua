-- Snacks terminal.

-- Install Snacks and enable its terminal module.
vim.pack.add({
  'https://github.com/folke/snacks.nvim',
})

require('snacks').setup({
  terminal = {},
})

-- Toggle a reusable terminal split at the bottom of the screen.
local function toggle_bottom_terminal()
  Snacks.terminal(nil, {
    win = {
      position = 'bottom',
      height = 15,
    },
  })
end

-- Most terminals send Ctrl+/ as Ctrl+_. Map both to be safe.
vim.keymap.set({ 'n', 't' }, '<C-/>', toggle_bottom_terminal, { desc = 'Toggle Terminal' })
vim.keymap.set({ 'n', 't' }, '<C-_>', toggle_bottom_terminal, { desc = 'Toggle Terminal' })

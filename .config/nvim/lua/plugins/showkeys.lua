-- Show pressed keys on screen.

-- Install and configure showkeys.
vim.pack.add({
  'https://github.com/nvzone/showkeys',
})

require('showkeys').setup({
  timeout = 2,
  maxkeys = 5,
  position = 'bottom-right',
})

-- Automatically turn on showkeys when Neovim UI is ready
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require('showkeys').toggle()
  end,
  desc = "Enable Showkeys by default on startup",
})

-- Manual toggle, useful for demos or checking keybinds.
vim.keymap.set('n', '<leader>uk', function()
  require('showkeys').toggle()
end, { desc = 'Toggle Showkeys' })

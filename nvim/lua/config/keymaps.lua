-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>a", function()
  require("harpoon.mark").add_file()
end)
vim.keymap.set("n", "<leader>s", function()
  require("harpoon.ui").toggle_quick_menu()
end)
vim.keymap.set("n", "<leader>1", function()
  require("harpoon.ui").nav_file(1)
end)
vim.keymap.set("n", "<leader>2", function()
  require("harpoon.ui").nav_file(2)
end)

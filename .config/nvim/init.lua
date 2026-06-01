-- Bootstrap lazy.nvim, LazyVim, and your plugins
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.o.wrap = false

-- Remaps
vim.keymap.set({ "n", "v" }, "d", '"_d')
vim.keymap.set({ "n", "v" }, "c", '"_c')
vim.api.nvim_set_keymap("x", "p", '"_dP', { noremap = true, silent = true })

-- disables copilot default tab mapping
vim.g.copilot_no_tab_map = true

-- copilot remaps (remap the copilot#Accept function to shift+tab)
vim.keymap.set("i", "<S-Tab>", 'copilot#Accept("<CR>")', {
  expr = true,
  silent = true,
})

vim.opt.clipboard = "unnamedplus"

require("config.lazy")

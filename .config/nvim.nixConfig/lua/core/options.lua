-- Core Neovim options and global settings.

-- Faster Lua module loading.
vim.loader.enable()

-- Leader keys must be set before plugin/keymap files are loaded.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- Editor behavior.
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true

-- Characters shown for tabs, trailing spaces, and non-breaking spaces.
vim.opt.listchars = {
  tab = '» ',
  trail = '·',
  nbsp = '␣',
}

-- Delay clipboard setup slightly for faster startup.
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)


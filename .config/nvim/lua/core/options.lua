-- Core Neovim options and global settings.

vim.loader.enable()

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 200
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.confirm = true
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.termguicolors = true

-- Spaces by default. C/C++ is reinforced in core/autocmds.lua.
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.smartindent = true

vim.opt.listchars = {
  tab = '» ',
  trail = '·',
  nbsp = '␣',
}

vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

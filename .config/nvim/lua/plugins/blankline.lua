-- Indent guides with indent-blankline.nvim.

-- Install indent guide plugin.
vim.pack.add({
  'https://github.com/lukas-reineke/indent-blankline.nvim',
})

-- Indent guide appearance and exclusions.
require('ibl').setup({
  indent = {
    char = '│',
  },
  scope = {
    enabled = true,
    show_start = false,
    show_end = false,
  },
  exclude = {
    filetypes = {
      'help',
      'alpha',
      'dashboard',
      'neo-tree',
      'lazy',
      'mason',
      'notify',
      'toggleterm',
      'Trouble',
    },
    buftypes = {
      'terminal',
      'nofile',
    },
  },
})


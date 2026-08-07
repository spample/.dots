-- Small standalone plugins with little or no config.

-- Install simple plugins that mostly work as soon as they are loaded.
vim.pack.add({
  -- Tmux navigation.
  'https://github.com/christoomey/vim-tmux-navigator',

  -- Detect shiftwidth/tabstop automatically.
  'https://github.com/tpope/vim-sleuth',

  -- Autopairs.
  'https://github.com/windwp/nvim-autopairs',

  -- Markdown rendering inside Neovim.
  'https://github.com/OXY2DEV/markview.nvim',

})

-- Only nvim-autopairs needs explicit setup from this file.
require('nvim-autopairs').setup({})

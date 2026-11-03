-- Small standalone plugins with little or no config.

-- Install simple plugins that mostly work as soon as they are loaded.
vim.pack.add {
  -- Tmux navigation.
  'https://github.com/christoomey/vim-tmux-navigator',

  -- Git commands and GitHub integration.
  'https://github.com/tpope/vim-fugitive',
  'https://github.com/tpope/vim-rhubarb',

  -- Autopairs.
  'https://github.com/windwp/nvim-autopairs',

  -- GitHub Copilot.
  'https://github.com/github/copilot.vim',

  -- Markdown rendering inside Neovim.
  'https://github.com/OXY2DEV/markview.nvim',

  -- Golf plugin.
  'https://github.com/vuciv/golf',
}

-- Only nvim-autopairs needs explicit setup from this file.
require('nvim-autopairs').setup {}

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    vim.api.nvim_set_hl(0, 'MarkviewCode', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'MarkviewCodeInfo', { bg = 'NONE' })
  end,
})

require('markview').setup {
  code_blocks = {
    style = 'simple',
    hl = 'Normal', -- Uses your transparent standard background
    info_hl = 'Normal', -- Makes the language tag (e.g., "Bash") background transparent too
  },
}

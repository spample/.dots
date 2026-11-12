-- Neo-tree file explorer.

-- Install Neo-tree and its required dependencies.
vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

-- Open/reveal the current file in Neo-tree.
vim.keymap.set('n', '\\', '<cmd>Neotree reveal<CR>', {
  desc = 'NeoTree reveal',
  silent = true,
})

-- Filesystem window settings.
require('neo-tree').setup {
  filesystem = {
    -- Add this block to show hidden and git-ignored files by default
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = false,
    },
    use_libuv_file_watcher = true,
    window = {
      width = 30,
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
} -- Filesystem window settings.

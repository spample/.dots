-- Browser-based Markdown preview.

-- Install markdown-preview.nvim.
vim.pack.add({
  'https://github.com/iamcco/markdown-preview.nvim',
})

-- Only enable preview commands for Markdown buffers.
vim.g.mkdp_filetypes = { 'markdown' }

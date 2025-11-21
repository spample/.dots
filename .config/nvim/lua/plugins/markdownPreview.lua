return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  cmd = { "MarkdownPreview", "MarkdownPreviewToggle", "MarkdownPreviewStop" },
  build = "cd app && npm install", -- does NOT require running Vimscript functions

  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.g.mkdp_node_app_args = {} -- fixes Node 25 issue
  end,
}

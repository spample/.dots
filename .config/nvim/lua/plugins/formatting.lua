-- Formatting with conform.nvim.

vim.pack.add {
  'https://github.com/stevearc/conform.nvim',
}

require('conform').setup {
  notify_on_error = true,
  format_on_save = function(bufnr)
    local enabled = {
      c = true,
      cpp = true,
      objc = true,
      objcpp = true,
      lua = true,
      python = true,
    }
    if enabled[vim.bo[bufnr].filetype] then return { timeout_ms = 1000, lsp_format = 'fallback' } end
    return nil
  end,
  default_format_opts = {
    lsp_format = 'fallback',
  },
  formatters = {
    ['clang-format'] = {
      prepend_args = function(_, ctx)
        local dir = vim.fs.dirname(ctx.filename)
        local style = vim.fs.find({ '.clang-format', '_clang-format' }, { upward = true, path = dir })[1]
        if style then return {} end
        return { '--style={BasedOnStyle: LLVM, IndentWidth: 2, TabWidth: 2, UseTab: Never, ColumnLimit: 100}' }
      end,
    },
  },
  formatters_by_ft = {
    c = { 'clang-format' },
    cpp = { 'clang-format' },
    objc = { 'clang-format' },
    objcpp = { 'clang-format' },
    lua = { 'stylua' },
  },
}

vim.keymap.set(
  { 'n', 'v' },
  '<leader>f',
  function() require('conform').format { async = true, lsp_format = 'fallback' } end,
  { desc = '[F]ormat buffer/selection' }
)

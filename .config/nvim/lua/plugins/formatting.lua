-- Formatting with conform.nvim.

-- Install formatter plugin.
vim.pack.add({
  'https://github.com/stevearc/conform.nvim',
})

require('conform').setup({
  notify_on_error = false,

  -- Format selected filetypes automatically on save.
  format_on_save = function(bufnr)
    local enabled_filetypes = {
      lua = true,
      python = true,
    }

    if enabled_filetypes[vim.bo[bufnr].filetype] then
      return { timeout_ms = 500 }
    end

    return nil
  end,

  -- Use LSP formatting only when no external formatter is configured.
  default_format_opts = {
    lsp_format = 'fallback',
  },

  -- Add formatters here when you want external tools per filetype.
  formatters_by_ft = {
    -- python = { 'isort', 'black' },
    -- javascript = { 'prettierd', 'prettier', stop_after_first = true },
  },
})

-- Manual format keymap.
vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
  require('conform').format({ async = true })
end, { desc = '[F]ormat buffer' })

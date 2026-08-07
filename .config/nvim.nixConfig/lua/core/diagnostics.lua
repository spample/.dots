-- Diagnostic UI and behavior.

-- Configure how errors/warnings from LSPs and linters are displayed.
vim.diagnostic.config({
  update_in_insert = false,
  severity_sort = true,

  -- Floating diagnostic popup style.
  float = {
    border = 'rounded',
    source = 'if_many',
  },

  -- Only underline warnings and errors.
  underline = {
    severity = {
      min = vim.diagnostic.severity.WARN,
    },
  },

  -- Inline diagnostic display.
  virtual_text = true,
  virtual_lines = false,

  -- Show a diagnostic popup when jumping between diagnostics.
  jump = {
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float({
        bufnr = bufnr,
        scope = 'cursor',
        focus = false,
      })
    end,
  },
})

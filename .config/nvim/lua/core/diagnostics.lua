-- Diagnostic UI and behavior.

vim.diagnostic.config({
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = true,
  },
  underline = true,
  virtual_text = {
    spacing = 2,
    source = 'if_many',
  },
  virtual_lines = false,
  signs = true,
})

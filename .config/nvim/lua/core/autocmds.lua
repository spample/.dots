-- General autocommands.

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- C/C++: always use four spaces, never literal tabs.
vim.api.nvim_create_autocmd('FileType', {
  desc = 'C/C++ indentation',
  group = vim.api.nvim_create_augroup('cpp-indentation', { clear = true }),
  pattern = { 'c', 'cpp', 'objc', 'objcpp' },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.smartindent = true
  end,
})

-- Make recipes require real TAB characters. Keep Makefiles functional.
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Makefile indentation',
  group = vim.api.nvim_create_augroup('make-indentation', { clear = true }),
  pattern = 'make',
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- Return to the last cursor position when reopening a file.
vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Restore last cursor position',
  group = vim.api.nvim_create_augroup('restore-cursor', { clear = true }),
  callback = function(event)
    local mark = vim.api.nvim_buf_get_mark(event.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(event.buf)
    if mark[1] > 0 and mark[1] <= line_count then pcall(vim.api.nvim_win_set_cursor, 0, mark) end
  end,
})

-- make md files not transparent
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    -- Create a custom highlight using TokyoNight-night's exact background hex
    vim.api.nvim_set_hl(0, 'MarkdownSolid', { bg = '#1a1b26' })

    -- Apply it locally to the current window's background elements
    vim.opt_local.winhighlight = 'Normal:MarkdownSolid,NormalNC:MarkdownSolid,EndOfBuffer:MarkdownSolid,SignColumn:MarkdownSolid'
  end,
})

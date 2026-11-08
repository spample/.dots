-- QML / Quickshell quality-of-life helpers.
-- Formatting, LSP, and Tree-sitter are integrated in their existing modules.
local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('qml', {
  s('qshell', {
    t({ 'import QtQuick', 'import Quickshell', '', 'ShellRoot {', '    ' }),
    i(1, '// Quickshell root'),
    t({ '', '}' }),
  }),
  s('qrect', {
    t({ 'Rectangle {', '    id: ' }), i(1, 'root'),
    t({ '', '    width: ' }), i(2, '100'),
    t({ '', '    height: ' }), i(3, '40'),
    t({ '', '    radius: ' }), i(4, '8'),
    t({ '', '}' }),
  }),
  s('qproperty', {
    t('property '), i(1, 'string'), t(' '), i(2, 'name'),
    t(': '), i(3, '"value"'),
  }),
  s('qsignal', {
    t('signal '), i(1, 'triggered'), t('('), i(2), t(')'),
  }),
  s('qconnections', {
    t({ 'Connections {', '    target: ' }), i(1, 'Hyprland'),
    t({ '', '', '    function on' }), i(2, 'ActiveToplevelChanged'),
    t({ '() {', '        ' }), i(3, '// handle event'),
    t({ '', '    }', '}' }),
  }),
  s('qtimer', {
    t({ 'Timer {', '    interval: ' }), i(1, '1000'),
    t({ '', '    repeat: true', '    running: true', '    onTriggered: {' , '        ' }),
    i(2, '// update'), t({ '', '    }', '}' }),
  }),
  s('qcomponent', {
    t({ 'import QtQuick', '', 'Item {', '    id: root', '', '    ' }),
    i(1, '// component body'),
    t({ '', '}' }),
  }),
})

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('quickshell-qml-local', { clear = true }),
  pattern = 'qml',
  callback = function(event)
    local opts = { buffer = event.buf, silent = true }
    vim.bo[event.buf].expandtab = true
    vim.bo[event.buf].shiftwidth = 2
    vim.bo[event.buf].tabstop = 2
    vim.bo[event.buf].softtabstop = 2

    vim.keymap.set('n', '<leader>qf', function()
      require('conform').format({ async = true, lsp_format = 'fallback' })
    end, vim.tbl_extend('force', opts, { desc = 'QML: format buffer' }))

    vim.keymap.set('n', '<leader>ql', function()
      vim.cmd('LspInfo')
    end, vim.tbl_extend('force', opts, { desc = 'QML: LSP information' }))
  end,
})

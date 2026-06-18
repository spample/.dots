-- Completion engine, snippets, and completion keymaps.

local gh = require('core.utils').gh

-- Install completion and snippet plugins.
vim.pack.add({
  { src = gh('L3MON4D3/LuaSnip'), version = vim.version.range('2.*') },
  gh('rafamadriz/friendly-snippets'),
  { src = gh('saghen/blink.cmp'), version = vim.version.range('1.*') },
})

-- Snippet setup.
require('luasnip').setup({})
require('luasnip.loaders.from_vscode').lazy_load()

-- Blink completion setup.
require('blink.cmp').setup({
  keymap = {
    preset = 'super-tab',
  },
  appearance = {
    nerd_font_variant = 'mono',
  },
  completion = {
    documentation = {
      auto_show = false,
      auto_show_delay_ms = 500,
    },
  },
  sources = {
    default = { 'lsp', 'path', 'snippets' },
  },
  snippets = {
    preset = 'luasnip',
  },
  fuzzy = {
    implementation = 'prefer_rust_with_warning',
  },
  signature = {
    enabled = true,
  },
})

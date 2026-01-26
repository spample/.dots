-- ~/.config/nvim/lua/plugins/blink.lua
return {
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    version = "*",
    opts = {
      keymap = {
        preset = "super-tab",
      },

      appearance = {
        nerd_font_variant = "mono",
      },

      sources = {
        default = { "lsp", "path", "buffer" },
      },
    },
  },
}

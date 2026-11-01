-- ~/.config/nvim/lua/plugins/noice.lua

vim.pack.add({
  "https://github.com/folke/noice.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/rcarriga/nvim-notify",
})

require("noice").setup({
  cmdline = {
    enabled = true,
    view = "cmdline_popup",
  },

  views = {
    cmdline_popup = {
      position = {
        row = "40%",
        col = "50%",
      },
      size = {
        width = 60,
        height = "auto",
      },
      border = {
        style = "rounded",
      },
    },
  },

  presets = {
    bottom_search = true, -- keep / search at the bottom
    command_palette = true, -- puts cmdline and completion menu together
    long_message_to_split = true,
  },
})
-- Noice popup colors.
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", {
  fg = "#6686CA",
})

vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", {
  bg = "#1e1e2e",
})

vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", {
  fg = "#f5c2e7",
})

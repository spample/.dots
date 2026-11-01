-- ~/.config/nvim/lua/plugins/bufferline.lua

vim.pack.add({
  "https://github.com/akinsho/bufferline.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
})

require("bufferline").setup({
  options = {
    mode = "buffers",
    diagnostics = "nvim_lsp",
    separator_style = "slant",
    show_buffer_close_icons = true,
    show_close_icon = false,
    always_show_bufferline = true,
  },
})

-- bufferline Keymaps
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", {
  desc = "Next buffer",
})

vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", {
  desc = "Previous buffer",
})

vim.keymap.set("n", "<leader>x", function()
  require("mini.bufremove").delete(0, false)
end, {
  desc = "Close buffer without closing window",
})


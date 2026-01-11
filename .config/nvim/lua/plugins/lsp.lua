-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")
      local util = lspconfig.util

      -- Blink completion → LSP capabilities
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      ------------------------------------------------------------------
      -- C / C++ / PlatformIO
      ------------------------------------------------------------------
      lspconfig.clangd.setup({
        cmd = { "clangd", "--query-driver=/usr/bin/**" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = util.root_pattern("platformio.ini", ".git"),
        capabilities = capabilities,
      })

      ------------------------------------------------------------------
      -- QML / QtQuick
      ------------------------------------------------------------------
      lspconfig.qmlls.setup({
        cmd = { "qmlls6" }, -- Arch Qt6 binary
        filetypes = { "qml" },
        root_dir = util.root_pattern(".qmlls.ini", "qmlproject", ".git"),
        capabilities = capabilities,
      })
    end,
  },
}

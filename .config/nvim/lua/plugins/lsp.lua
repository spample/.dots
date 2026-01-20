-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Simple servers
        html = {},
        cssls = {},
        jsonls = {},
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      local util = lspconfig.util
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Manual / advanced servers
      lspconfig.clangd.setup({
        cmd = { "clangd", "--query-driver=/usr/bin/**" },
        root_dir = util.root_pattern("platformio.ini", ".git"),
        capabilities = capabilities,
      })

      lspconfig.qmlls.setup({
        cmd = { "qmlls6" },
        root_dir = util.root_pattern(".qmlls.ini", "qmlproject", ".git"),
        capabilities = capabilities,
      })
    end,
  },
}

-- ~/.config/nvim/lua/plugins/platformio_lsp.lua
local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- for capability integration
  },
}

function M.config()
  local lspconfig = require("lspconfig")

  -- clangd for PlatformIO C/C++
  lspconfig.clangd.setup({
    cmd = { "clangd", "--query-driver=/usr/bin/**" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = lspconfig.util.root_pattern("platformio.ini", ".git"),
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = function(client, bufnr)
      -- optional: keymaps specific to LSP
      local wk = require("which-key")
      wk.register({
        g = {
          d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
          r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
        },
        K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
      }, { buffer = bufnr })
    end,
  })
end

return M

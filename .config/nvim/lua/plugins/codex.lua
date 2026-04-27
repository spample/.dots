return {
  "ishiooon/codex.nvim",
  dependencies = {
    "folke/snacks.nvim",
  },
  config = function()
    -- Use vim.schedule to run setup after the UI is ready
    vim.schedule(function()
      require("codex").setup({
        -- Optional: Disable the status indicator if the error persists
        -- status_indicator = { enabled = false },
      })
    end)
  end,
  keys = {
    { "<leader>cc", "<cmd>Codex<cr>", desc = "Codex: Toggle Terminal" },
    { "<leader>cs", ":CodexSend<cr>", mode = "v", desc = "Codex: Send Selection" },
  },
}

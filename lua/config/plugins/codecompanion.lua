return {
  {
    "olimorris/codecompanion.nvim",
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "j-hui/fidget.nvim"
    },
    init = function()
      require("user.codecompanion-fidget"):init()
    end,
    -- opts = {
    --   strategies = {
    --     chat = {
    --       adapter = "openrouter_claude",
    --     },
    --   },
    -- },
  }
}

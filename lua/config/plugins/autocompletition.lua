return {
  -- Autocompletion
  "iguanacucumber/magazine.nvim",
  name = "nvim-cmp", -- Otherwise highlighting gets messed up
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source

    -- Adds LSP completion capabilities
    -- 'hrsh7th/cmp-nvim-lsp',

    -- Adds a number of user-friendly snippets
    -- 'hrsh7th/cmp-nvim-lsp-signature-help'
  },
  { "iguanacucumber/mag-nvim-lsp", name = "cmp-nvim-lsp", opts = {} },
  { "iguanacucumber/mag-nvim-lua", name = "cmp-nvim-lua" },
  { "iguanacucumber/mag-buffer",   name = "cmp-buffer" },
  { "iguanacucumber/mag-cmdline",  name = "cmp-cmdline" },
  { "saadparwaiz1/cmp_luasnip" },
  { "L3MON4D3/LuaSnip" },
  { "rafamadriz/friendly-snippets" }

}

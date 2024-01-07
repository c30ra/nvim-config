require("mason-null-ls").setup({
  ensure_installed = {
    "black",
    "ruff",
    "mypy",
  }
})

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.diagnostics.mypy,
  },
})

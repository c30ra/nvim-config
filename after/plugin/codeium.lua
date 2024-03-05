local codeium = require("config.plugins.codeium")
-- vim.keymap.set("n", "<space>cc", codeium.Chat , { noremap = true, desc = "Codeium Chat" })
-- vim.keymap.set("n", "<space>cc", function() return vim.fn['codeium#Chat']() end,
--   { noremap = true, desc = "Codeium Chat" })
--
-- -- write a bind that doesn't conflict with nvim-cmp when accepting a completition
-- vim.keymap.set("i", "<TAB>", function() return vim.fn['codeium#Accept']() end,
--   { noremap = true, desc = "Codeium Accept" })

require("lualine").setup({
    options = {
        icons_enabled = false,
        theme = "onedark",
        component_separators = "|",
        section_separators = ""
    },
    sections = {
        lualine_c = {
            {
                "filename",
                path = 4,
                function()
                    return require('lsp-progress').progress()
                end,
            }
        }
    }
})

-- listen lsp-progress event and refresh lualine
vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
    group = "lualine_augroup",
    pattern = "LspProgressStatusUpdated",
    callback = require("lualine").refresh,
})

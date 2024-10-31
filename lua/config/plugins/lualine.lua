return {
    {
        -- Set lualine as statusline
        "nvim-lualine/lualine.nvim",
        dependencies = {
            {
                "linrongbin16/lsp-progress.nvim",
                config = function()
                    require('lsp-progress').setup()
                end
            }
        },
        -- See `:help lualine.txt`
        opts = {
        }
    }
}

require("oil").setup()

require('which-key').register {
	['<leader>f'] = { name = '[F]ile', _ = 'which_key_ignore' },
}
vim.api.nvim_set_keymap(
	"n",
	"<space>fb",
	":Oil <CR>",
	{ noremap = true, desc = "Browser" }
)

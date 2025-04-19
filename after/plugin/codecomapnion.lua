local wk = require("which-key")
require("codecompanion").setup({
	adapters = {
		openrouter_claude = function()
			return require("codecompanion.adapters").extend("openai_compatible", {
				env = {
					url = "https://openrouter.ai/api",
					api_key = "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",
					chat_url = "/v1/chat/completions",
				},
				schema = {
					model = {
						default = "google/gemini-2.5-pro-preview-03-25",
					},
				},
			})
		end,
	},
	strategies = {
		chat = {

			adapter = "openrouter_claude",
			keymaps = {
				close = {
					modes = { n = {}, i = {} },
				},
			},
		},
		inline = {
			adapter = "openrouter_claude",
		},
		cmd = {
			adapter = "openrouter_claude",
		},
	},
	display = {
		window = {
			position = "right",
		},
	},
})

wk.add({
	{ "<leader>cc", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanion Actions" },
	{ "<leader>ct", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "CodeCompanion Toggle Chat" },
})

vim.cmd([[cab cc CodeCompanion]])

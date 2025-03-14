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
						default = "anthropic/claude-3.5-sonnet",
					},
				},
			})
		end,
	},
	strategies = {
		chat = {
			adapter = "openrouter_claude",
		},
	}
})

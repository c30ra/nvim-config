return {
	"OXY2DEV/markview.nvim",
	enabled = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- Used by the code bloxks
	},

	config = function()
		require("markview").setup()
	end,
}

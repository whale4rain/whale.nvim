return {
	"rebelot/heirline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("heirline").setup({
			statusline = require("plugins.setup.heirline.statusline"),
		})
	end,
}

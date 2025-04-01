return {
	"rebelot/heirline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("heirline").setup({
			statusline = require("plugins.config.heirline.statusline"),
			-- tabline = require 'custom.config.heirline.tabline',
		})
	end,
}

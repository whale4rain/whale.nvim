return {
	"ellisonleao/carbon-now.nvim",
	event = "VeryLazy",
	cmd = "CarbonNow",
	---@param opts cn.ConfigSchema
	config = function()
		local carbon = require("carbon-now")
		carbon.setup({
			options = {
				theme = "SynthWave '84",
				font_family = "FiraCode Nerd Font Mono",
				-- titlbar = file name
				titlebar = "whale4rain",
			},
		})
	end,
}

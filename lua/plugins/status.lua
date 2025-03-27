return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				section_separators = { left = "⣿", right = "⣿" },
				component_separators = { left = "|", right = "|" },
				-- theme = 'powerline'
				-- theme = "palenight",
			},
		})
	end,
}

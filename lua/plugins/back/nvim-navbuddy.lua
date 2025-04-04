return {
	"SmiteshP/nvim-navbuddy",
	event = "BufReadPre",
	requires = {
		"neovim/nvim-lspconfig",
		"SmiteshP/nvim-navic",
		"MunifTanjim/nui.nvim",
		"numToStr/Comment.nvim", -- Optional
		"nvim-telescope/telescope.nvim", -- Optional
	},
	config = function()
		local navbuddy = require("nvim-navbuddy")

		require("lspconfig").lua_ls.setup({
			on_attach = function(client, bufnr)
				navbuddy.attach(client, bufnr)
			end,
		})
	end,
}

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"go",
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"python",
				"rust",
				"javascript",
				"html",
				"cpp",
				"regex",
			},
			sync_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
		vim.wo.foldmethod = "expr"
		-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo.foldlevel = 99
	end,
}

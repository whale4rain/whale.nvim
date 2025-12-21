return {
	-- {
	-- 	"ramojus/mellifluous.nvim",
	-- 	-- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
	-- 	config = function()
	-- 		require("mellifluous").setup({}) -- optional, see configuration section.
	-- 		vim.cmd("colorscheme mellifluous")
	-- 	end,
	-- },
	{
		"whale4rain/blue-whale.nvim",
		config = function()
			vim.cmd("colorscheme blue-whale")
		end,
	}
}
--	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- 	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

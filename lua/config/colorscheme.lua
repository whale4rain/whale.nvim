return {
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme gruvbox")
		end,
	},
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		vim.cmd("colorscheme rose-pine")
	-- 	end,
	-- },
	-- {
	-- 	"nyoom-engineering/oxocarbon.nvim",
	-- 	-- Add in any other configuration;
	-- 	--   event = foo,
	-- 	--   config = bar
	-- 	--   end,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("oxocarbon")
	-- 		-- 透明背景
	-- 		--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- 		--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- 		--vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	-- 	end,
	-- },
}

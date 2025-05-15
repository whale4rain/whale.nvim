return {
	-- {
	-- 	"ramojus/mellifluous.nvim",
	-- 	-- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
	-- 	config = function()
	-- 		require("mellifluous").setup({}) -- optional, see configuration section.
	-- 		vim.cmd("colorscheme mellifluous")
	-- 	end,
	-- },
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("catppuccin")
	-- 	end,
	-- },
	-- {
	-- 	"datsfilipe/vesper.nvim",
	-- 	name = "vesper",
	-- 	config = function()
	-- 		vim.cmd.colorscheme("vesper")
	-- 		require("vesper").setup({
	-- 			transparent = false, -- Boolean: Sets the background to transparent
	-- 			italics = {
	-- 				comments = true, -- Boolean: Italicizes comments
	-- 				keywords = true, -- Boolean: Italicizes keywords
	-- 				functions = true, -- Boolean: Italicizes functions
	-- 				strings = true, -- Boolean: Italicizes strings
	-- 				variables = true, -- Boolean: Italicizes variables
	-- 			},
	-- 			overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
	-- 			palette_overrides = {},
	-- 		})
	-- 		require("bufferline").setup({
	-- 			highlights = require("vesper").bufferline.highlights,
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	name = "gruvbox",
	-- 	config = function()
	-- 		vim.cmd("colorscheme gruvbox")
	-- 	end,
	-- },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme rose-pine-moon")
		end,
	},
	-- {
	-- 	"nyoom-engineering/oxocarbon.nvim",
	-- 	name = "oxocarbon",
	-- 	priority = 1001,
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

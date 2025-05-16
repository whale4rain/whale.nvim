-- return {
-- 	"windwp/nvim-autopairs",
-- 	event = { "InsertEnter" },
-- 	dependencies = {
-- 		"hrsh7th/nvim-cmp",
-- 	},
-- 	config = function()
-- 		-- import nvim-autopairs
-- 		local autopairs = require("nvim-autopairs")
--
-- 		-- configure autopairs
-- 		autopairs.setup({
-- 			check_ts = true, -- enable treesitter
-- 			ts_config = {
-- 				lua = { "string" }, -- don't add pairs in lua string treesitter nodes
-- 				javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
-- 				java = false, -- don't check treesitter on java
-- 			},
-- 		})
-- 	end,
-- }
return {
	"echasnovski/mini.pairs",
	version = "*",
	modes = { insert = true, command = false, terminal = false },

	-- Global mappings. Each right hand side should be a pair information, a
	-- table with at least these fields (see more in |MiniPairs.map|):
	-- - <action> - one of 'open', 'close', 'closeopen'.
	-- - <pair> - two character string for pair to be used.
	-- By default pair is not inserted after `\`, quotes are not recognized by
	-- <CR>, `'` does not insert pair after a letter.
	-- Only parts of tables can be tweaked (others will use these defaults).
	mappings = {
		["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
		["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
		["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

		[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
		["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
		["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

		['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
		["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
		["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
	},
	config = function()
		require("mini.pairs").setup({})
	end,
}

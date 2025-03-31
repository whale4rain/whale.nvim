-- return {
-- 	"Bekaboo/dropbar.nvim",
-- 	-- optional, but required for fuzzy finder support
-- 	event = { "BufReadPre", "BufNewFile" },
-- 	dependencies = {
-- 		"nvim-telescope/telescope-fzf-native.nvim",
-- 		build = "make",
-- 	},
-- 	config = function()
-- 		local dropbar_api = require("dropbar.api")
-- 		vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
-- 		vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
-- 		vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
-- 	end,
-- }
return {
	"Bekaboo/dropbar.nvim",
	enabled = false,
	event = { "BufReadPre" },
	opts = {
		sources = {
			path = {
				modified = function(sym)
					return sym:merge({
						name = sym.name .. " 􀴥 ",
						-- icon = ' ',
						-- name_hl = 'DiffAdded',
						-- icon_hl = 'DiffAdded',
						-- ...
					})
				end,
			},
		},
	},
	-- config = function()
	-- 	local dropbar_api = require("dropbar.api")
	-- 	vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
	-- 	vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
	-- 	vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
	-- end,
}

return {
	"folke/edgy.nvim",
	event = "VeryLazy",

	opts = {
		bottom = {
			-- toggleterm / lazyterm at the bottom with a height of 40% of the screen
			{
				ft = "toggleterm",
				size = { height = 0.3 },
				-- exclude floating windows
				filter = function(buf, win)
					return vim.api.nvim_win_get_config(win).relative == ""
				end,
			},
			{
				ft = "trouble",
				size = { height = 0.3 },
				filter = function(buf, win)
					return vim.api.nvim_win_get_config(win).relative == ""
				end,
			},
		},
		left = {
			-- Neo-tree filesystem always takes half the screen height
			{
				title = "Neo-Tree",
				ft = "neo-tree",
				filter = function(buf)
					return vim.b[buf].neo_tree_source == "filesystem"
				end,
				size = { height = 0.5 },
			},
			{
				title = "Neo-Tree Git",
				ft = "neo-tree",
				filter = function(buf)
					return vim.b[buf].neo_tree_source == "git_status"
				end,
				pinned = true,
				collapsed = true, -- show window as closed/collapsed on start
				open = "Neotree position=right git_status",
			},
		},
	},
}

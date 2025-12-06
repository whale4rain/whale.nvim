return {
	"nvimdev/lspsaga.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
	config = function()
		require("lspsaga").setup({
			-- symbol_in_winbar = {
			-- 	enable = false,
			-- 	--show_file = false,
			-- },
			ui = {
				code_action = "",
			},
			-- lightbulb = {
			-- 	virtual_text = false,
			-- },
		})
		vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { desc = "Prev Diagnostic" })
		vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>", { desc = "Next Diagnostic" })
		vim.keymap.set("n", "<leader>fi", "<cmd>Lspsaga finder<cr>", { desc = "Lspsaga Finder" })
		vim.keymap.set("n", "<leader>fo", "<cmd>Lspsaga outline<cr>", { desc = "Lspsaga Outline" })
	end,
}
--Default keymaps in outline.keys section:

-- toggle_or_jump = 'o' toggle or jump
-- quit = 'q' quit outline window
-- jump = 'e' jump to pos even on a expand/collapse node
--These are default keymaps in finder.keys table section:

-- shuttle = '[w' shuttle bettween the finder layout window
-- toggle_or_open = 'o' toggle expand or open
-- vsplit = 's' open in vsplit
-- split = 'i' open in split
-- tabe = 't' open in tabe
-- tabnew = 'r' open in new tab
-- quit = 'q' quit the finder, only works in layout left window
-- close = '<C-c>k' close finder

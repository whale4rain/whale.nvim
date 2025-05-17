return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			--	separator_style = "slant",
			diagnostics = "nvim_lsp",
			numbers = "ordinal",
		},
	},
	-- 快速在buffer间跳转
	vim.api.nvim_set_keymap("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true }),
	vim.api.nvim_set_keymap("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true }),
	vim.api.nvim_set_keymap("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true }),
	vim.api.nvim_set_keymap("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true }),
	vim.api.nvim_set_keymap("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true }),
	vim.api.nvim_set_keymap("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true }),
	vim.api.nvim_set_keymap("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true }),
	vim.api.nvim_set_keymap("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true }),
	vim.api.nvim_set_keymap("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true }),
	vim.api.nvim_set_keymap("n", "<leader>$", ":BufferLineGoToBuffer -1<CR>", { noremap = true, silent = true }),
	vim.api.nvim_set_keymap(
		"n",
		"<leader>bmn",
		":BufferLineMoveNext<CR>",
		{ noremap = true, silent = true, desc = "Move to next buffer" }
	),
	vim.api.nvim_set_keymap(
		"n",
		"<leader>bmp",
		":BufferLineMovePrev<CR>",
		{ noremap = true, silent = true, desc = "Move to previous buffer" }
	),
}

vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
})

local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_ok then
	return
end

treesitter.setup({
	ensure_installed = {
		"go", "c", "lua", "vim", "vimdoc", "query",
		"python", "rust", "javascript", "html", "cpp", "regex",
	},
	sync_install = false,
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
})

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldlevel = 99

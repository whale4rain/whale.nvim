vim.pack.add({
	"https://github.com/saghen/blink.cmp",
	"https://github.com/rafamadriz/friendly-snippets",
})

require("blink.cmp").setup({
	fuzzy = {
		implementation = "lua",
		-- frecency = { enabled = true },
		-- prebuilt_binaries = {
		-- 	download = true,
		-- 	force_version = nil,
		-- },
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	cmdline = {
		keymap = {
			["<Tab>"] = { "select_and_accept", "fallback" },
		},
		completion = {
			menu = { auto_show = true },
			ghost_text = { enabled = true },
		},
	},
	keymap = {
		["<C-up>"] = { "scroll_documentation_up", "fallback" },
		["<C-down>"] = { "scroll_documentation_down", "fallback" },
	},
	completion = {
		keyword = { range = "full" },
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
			treesitter_highlighting = true
		},
		--list = { selection = { preselect = false, auto_insert = true } },
	},
	signature = {
		enabled = true,
	},
})

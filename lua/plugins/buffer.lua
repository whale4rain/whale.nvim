vim.pack.add({
	"https://github.com/romgrk/barbar.nvim",
})

vim.g.barbar_auto_setup = false

require("barbar").setup({
	animation = false,
	auto_hide = false,
	tabpages = false,
	clickable = true,
	exclude_ft = { "javascript" },
	exclude_name = { "package.json" },
	focus_on_close = "left",
	hide = { extensions = true, inactive = true },
	highlight_alternate = false,
	highlight_inactive_file_icons = false,
	highlight_visible = false,
	icons = {
		buffer_index = false,
		buffer_number = false,
		button = "",
		diagnostics = {
			[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "ﬀ" },
			[vim.diagnostic.severity.WARN] = { enabled = false },
			[vim.diagnostic.severity.INFO] = { enabled = false },
			[vim.diagnostic.severity.HINT] = { enabled = true },
		},
		gitsigns = {
			added = { enabled = true, icon = "+" },
			changed = { enabled = true, icon = "~" },
			deleted = { enabled = true, icon = "-" },
		},
		filetype = {
			custom_colors = false,
			enabled = true,
		},
		separator = { left = "▎", right = "" },
		separator_at_end = true,
		modified = { button = "●" },
		pinned = { button = "", filename = true },
		preset = "default",
		alternate = { filetype = { enabled = false } },
		current = { buffer_index = true },
		inactive = { button = "×" },
		visible = { modified = { buffer_number = false } },
	},
	insert_at_end = false,
})

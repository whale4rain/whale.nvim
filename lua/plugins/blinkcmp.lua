return {
	"saghen/blink.cmp",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		-- "L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"xzbdmw/colorful-menu.nvim",
	},
	version = "*",
	opts = {
		--		snippets = { preset = "luasnip" },
		cmdline = {
			keymap = {
				-- 选择并接受预选择的第一个
				["<Tab>"] = { "select_and_accept", "fallback" },
			},
			completion = {
				-- 自动显示补全窗口
				menu = { auto_show = true },
				-- 不在当前行上显示所选项目的预览
				ghost_text = { enabled = true },
			},
		},

		keymap = {
			["<C-u>"] = { "scroll_documentation_up", "fallback" },
			["<C-d>"] = { "scroll_documentation_down", "fallback" },
		},
		completion = {
			-- 示例：使用'prefix'对于'foo_|_bar'单词将匹配'foo_'(光标前面的部分),使用'full'将匹配'foo__bar'(整个单词)
			keyword = { range = "full" },
			-- 选择补全项目时显示文档(0.5秒延迟)
			documentation = { auto_show = true, auto_show_delay_ms = 500 },
			-- 不预选第一个项目，选中后自动插入该项目文本
			list = { selection = { preselect = false, auto_insert = true } },
		},
		signature = {
			enabled = true,
		},
	},
	config = function()
		require("blink.cmp").setup({
			completion = {
				menu = {
					draw = {
						-- We don't need label_description now because label and label_description are already
						-- combined together in label by colorful-menu.nvim.
						columns = { { "kind_icon" }, { "label", gap = 1 } },
						components = {
							label = {
								text = function(ctx)
									return require("colorful-menu").blink_components_text(ctx)
								end,
								highlight = function(ctx)
									return require("colorful-menu").blink_components_highlight(ctx)
								end,
							},
						},
					},
				},
			},
		})
	end,
}

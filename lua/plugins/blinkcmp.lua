return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"mikavilpas/blink-ripgrep.nvim",
	},

	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
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
			preset = "none",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			-- fallback命令将运行下一个非闪烁键盘映射(回车键的默认换行等操作需要)
			["<C-t>"] = { "accept", "fallback" }, -- 更改成'select_and_accept'会选择第一项插入
			["<C-n>"] = { "select_prev", "snippet_backward", "fallback" },
			["<C-N>"] = { "select_next", "snippet_forward", "fallback" }, -- 同时存在补全列表和snippet时，补全列表选择优先级更高

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },

			["<C-e>"] = { "snippet_forward", "select_next", "fallback" }, -- 同时存在补全列表和snippet时，snippet跳转优先级更高
			["<C-u>"] = { "snippet_backward", "select_prev", "fallback" },
		},
		completion = {
			-- 示例：使用'prefix'对于'foo_|_bar'单词将匹配'foo_'(光标前面的部分),使用'full'将匹配'foo__bar'(整个单词)
			keyword = { range = "full" },
			-- 选择补全项目时显示文档(0.5秒延迟)
			documentation = { auto_show = true, auto_show_delay_ms = 500 },
			-- 不预选第一个项目，选中后自动插入该项目文本
			list = { selection = { preselect = false, auto_insert = true } },
		},

		-- 指定文件类型启用/禁用
		enabled = function()
			return not vim.tbl_contains({
				"markdown",
			}, vim.bo.filetype) and vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
		end,

		-- -- 已定义启用的提供程序的默认列表，以便您可以扩展它
		-- sources = {
		-- 	default = {
		-- 		"buffer",
		-- 		"ripgrep",
		-- 		"lsp",
		-- 		"path",
		-- 		"snippets",
		-- 	},
		-- 	providers = {
		-- 		-- score_offset设置优先级数字越大优先级越高
		-- 		buffer = { score_offset = 5 },
		-- 		ripgrep = {
		-- 			module = "blink-ripgrep",
		-- 			name = "Ripgrep",
		-- 			score_offset = 4,
		-- 		},
		-- 		path = { score_offset = 3 },
		-- 		lsp = { score_offset = 2 },
		-- 		snippets = { score_offset = 1 },
		-- 	},
		-- },
	},
	-- 由于“opts_extend”，您的配置中的其他位置无需重新定义它
	opts_extend = { "sources.default" },
}

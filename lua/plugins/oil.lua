return {
	"stevearc/oil.nvim",
	event = "VeryLazy",
	opts = {
		-- 禁用不必要的功能保持轻量
		skip_confirm_for_simple_edits = true,
		delete_to_trash = false,
		-- 简洁的键位映射
		keymaps = {
			["g?"] = { "actions.show_help", mode = "n" },
			["<CR>"] = "actions.select",
			["<C-s>"] = { "actions.select", opts = { vertical = true } },
			["<C-h>"] = { "actions.select", opts = { horizontal = true } },
			["<C-t>"] = { "actions.select", opts = { tab = true } },
			["<C-p>"] = "actions.preview",
			["<C-c>"] = { "actions.close", mode = "n" },
			["<C-l>"] = "actions.refresh",
			["-"] = { "actions.parent", mode = "n" },
			["_"] = { "actions.open_cwd", mode = "n" },
			["`"] = { "actions.cd", mode = "n" },
			["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
			["gs"] = { "actions.change_sort", mode = "n" },
			["gx"] = "actions.open_external",
			["g."] = { "actions.toggle_hidden", mode = "n" },
			["g\\"] = { "actions.toggle_trash", mode = "n" },
		},
		-- 优化显示
		view_options = {
			show_hidden = false,
			natural_order = true,
		},
	},
	-- 按需加载
	cmd = "Oil",
	keys = {
		{ "-", "<cmd>Oil<CR>", desc = "打开文件浏览器" },
	},
	config = function(_, opts)
		require("oil").setup(opts)
	end,
	config = function()
		function _G.get_oil_winbar()
			local dir = require("oil").get_current_dir()
			if dir then
				return vim.fn.fnamemodify(dir, ":~")
			else
				return vim.api.nvim_buf_get_name(0)
			end
		end
		require("oil").setup({
			default_file_explorer = true,
			win_options = {
				winbar = "%!v:lua.get_oil_winbar()",
			},
		})
	end,
}

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		-- 设置 PowerShell 相关选项
		local powershell_options = {
			shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell", -- 优先使用 pwsh，否则使用 powershell
			shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
			shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
			shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
			shellquote = "",
			shellxquote = "",
		}

		-- 将 PowerShell 配置应用到 Neovim 的选项
		for option, value in pairs(powershell_options) do
			vim.opt[option] = value
		end

		-- 配置 toggleterm.nvim
		require("toggleterm").setup({
			size = 20, -- 终端窗口的高度
			open_mapping = [[<c-\>]], -- 打开/关闭终端的快捷键
			direction = "horizontal", -- 终端窗口的方向（horizontal, vertical, float, tab）
			shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell", -- 使用 PowerShell 作为默认 shell
			auto_scroll = true, -- 自动滚动到底部
			persist_mode = true, -- 保持终端状态

			-- 自定义终端
			terminals = {
				{
					cmd = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell", -- 使用 PowerShell
					direction = "horizontal",
					hidden = true, -- 默认隐藏
				},
			},
		})

		-- 设置快捷键
		local keymap = vim.keymap

		-- 打开/关闭终端
		keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })

		-- 打开/关闭浮动终端
		keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle floating terminal" })

		-- 打开/关闭垂直终端
		keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Toggle vertical terminal" })

		-- 打开/关闭标签页终端
		keymap.set("n", "<leader>ttab", "<cmd>ToggleTerm direction=tab<cr>", { desc = "Toggle tab terminal" })
	end,
}

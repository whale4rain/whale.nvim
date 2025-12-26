vim.pack.add({
	"https://github.com/akinsho/toggleterm.nvim",
})

-- PowerShell settings
local powershell_options = {
	shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
	shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
	shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
	shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
	shellquote = "",
	shellxquote = "",
}

for option, value in pairs(powershell_options) do
	vim.opt[option] = value
end

require("toggleterm").setup({
	size = function(term)
		if term.direction == "vertical" then
			return vim.o.columns * 0.3
		elseif term.direction == "horizontal" then
			return vim.o.lines * 0.3
		end
	end,
	open_mapping = [[<c-\>]],
	direction = "horizontal",
	shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
	auto_scroll = true,
	persist_mode = true,
})

-- Keymaps
local keymap = vim.keymap
keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Toggle horizontal terminal" })
keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle floating terminal" })
keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Toggle vertical terminal" })
keymap.set("n", "<leader>tp", "<cmd>ToggleTerm direction=tab<cr>", { desc = "Toggle tab terminal" })

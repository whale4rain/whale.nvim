vim.pack.add({
	"https://github.com/folke/snacks.nvim",
})

require("snacks").setup({
	notifier = {},
	picker = {
		matcher = { frecency = true, cwd_bonus = true, history_bonus = true },
		formatters = { icon_width = 3 },
		win = {
			input = {
				keys = {
					["<C-t>"] = { "edit_tab", mode = { "n", "i" } },
				},
			},
		},
	},
	dashboard = { enabled = false },
	indent = {
		enabled = false,
		indent = { enabled = false },
		animate = { duration = { step = 10, duration = 100 } },
		scope = { enabled = true, char = "┊", underline = false, only_current = true, priority = 1000 },
	},
})

local map = function(key, func, desc)
	vim.keymap.set("n", key, func, { desc = desc })
end

local Snacks = require("snacks")
map("<leader>ff", function()
	Snacks.picker.smart()
end, "Smart find file")
map("<leader>fo", function()
	Snacks.picker.recent()
end, "Find recent file")
map("<leader>fw", function()
	Snacks.picker.grep()
end, "Find content")
map("<leader>fh", function()
	Snacks.picker.help({ layout = "dropdown" })
end, "Find in help")
map("<leader>fl", function()
	Snacks.picker.picker_layouts()
end, "Find picker layout")
map("<leader>fk", function()
	Snacks.picker.keymaps({ layout = "dropdown" })
end, "Find keymap")
map("<leader><leader>", function()
	Snacks.picker.buffers({ sort_lastused = true })
end, "Find buffers")
map("<leader>fm", function()
	Snacks.picker.marks()
end, "Find mark")
map("<leader>fn", function()
	Snacks.picker.notifications({ layout = "dropdown" })
end, "Find notification")
map("grr", function()
	Snacks.picker.lsp_references()
end, "Find lsp references")
map("<leader>fS", function()
	Snacks.picker.lsp_workspace_symbols()
end, "Find workspace symbol")
-- map("<leader>fs", function()
-- 	local bufnr = vim.api.nvim_get_current_buf()
-- 	local clients = vim.lsp.get_clients({ bufnr = bufnr })

-- 	local function has_lsp_symbols()
-- 		for _, client in ipairs(clients) do
-- 			if client.server_capabilities.documentSymbolProvider then
-- 				return true
-- 			end
-- 		end
-- 		return false
-- 	end

-- 	if has_lsp_symbols() then
-- 		Snacks.picker.lsp_symbols({ layout = "dropdown", tree = true })
-- 	else
-- 		Snacks.picker.treesitter()
-- 	end
-- end, "Find symbol in current buffer")
map("<leader>fi", function()
	Snacks.picker.icons()
end, "Find icon")
map("<leader>fI", function()
	Snacks.picker.lsp_incoming_calls()
end, "Find incoming calls")
map("<leader>fO", function()
	Snacks.picker.lsp_outgoing_calls()
end, "Find outgoing calls")
map("<leader>fb", function()
	Snacks.picker.lines()
end, "Find lines in current buffer")
map("<leader>fd", function()
	Snacks.picker.diagnostics_buffer()
end, "Find diagnostic in current buffer")
map("<leader>fH", function()
	Snacks.picker.highlights()
end, "Find highlight")
map("<leader>fc", function()
	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, "Find nvim config file")
map("<leader>f/", function()
	Snacks.picker.search_history()
end, "Find search history")
map("<leader>fj", function()
	Snacks.picker.jumps()
end, "Find jump")
map("<leader>bc", function()
	Snacks.bufdelete.delete()
end, "Delete buffers")
map("<leader>bC", function()
	Snacks.bufdelete.other()
end, "Delete other buffers")
map("<leader>gg", function()
	Snacks.lazygit({ cwd = Snacks.git.get_root() })
end, "Open lazygit")
map("<leader>n", function()
	Snacks.notifier.show_history()
end, "Notification history")
map("<leader>N", function()
	Snacks.notifier.hide()
end, "Hide notifications")
map("<leader>gb", function()
	Snacks.git.blame_line()
end, "Git blame line")

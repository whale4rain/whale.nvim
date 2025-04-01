---@diagn
-- 加载 ASCII 艺术文
local ascii_art = require("plugins.config.ascii_art_2")
local function random_header()
	return ascii_art[math.random(10)]
end

require("snacks").setup({
	styles = {
		notification = { border = "single" },
		notification_history = { border = "single", width = 0.9, height = 0.9, minimal = true },
		snacks_image = {
			border = "single",
		},
	},
	notifier = {},
	bufdelete = {},
	dashboard = {
		preset = {
			keys = {
				{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
				{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
				{ icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
				{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
				{
					icon = " ",
					key = "c",
					desc = "Config",
					action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
				},
				{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
				{ icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
				{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
			},
			header = random_header(),
		},
		sections = {
			{ section = "header" },
			{ section = "keys", gap = 1, padding = 1 },
			{ pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
			{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
			-- {
			-- 	pane = 2,
			-- 	icon = " ",
			-- 	title = "Git Status",
			-- 	section = "terminal",
			-- 	enabled = function()
			-- 		return Snacks.git.get_root() ~= nil
			-- 	end,
			-- 	cmd = "git status --short --branch --renames",
			-- 	height = 5,
			-- 	padding = 1,
			-- 	ttl = 5 * 60,
			-- 	indent = 3,
			-- },
			{ section = "startup" },
		},
	},
	statuscolumn = {
		folds = {
			open = true, -- show open fold icons
			git_hl = true, -- use Git Signs hl for fold icons
		},
	},
	-- image = {
	-- 	enabled = true,
	-- 	doc = {
	-- 		enabled = true,
	-- 		inline = false,
	-- 		float = true,
	-- 		max_width = 40,
	-- 		max_height = 30,
	-- 	},
	-- 	resolve = function(_, src)
	-- 		local vault_path = vim.fn.expand("~")
	-- 			.. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian Vault"
	--
	-- 		-- when the file path is *attachments/*
	-- 		local att_path = src:match("(attachments/.*)")
	-- 		if att_path then
	-- 			return vault_path .. "/" .. att_path
	-- 		end
	--
	-- 		-- when the file path is pure basename without any directory component
	-- 		if not src:match("[/\\]") then
	-- 			return vault_path .. "/attachments/" .. src
	-- 		end
	--
	-- 		-- when the file path is absolute path
	-- 		if src:match("^/") then
	-- 			return src
	-- 		end
	--
	-- 		return src
	-- 	end,
	-- },
	picker = {
		matcher = {
			frecency = true,
			cwd_bonus = true,
			history_bonus = true,
		},
		formatters = {
			icon_width = 3,
		},
	},
	terminal = {},
})

-- ---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
-- local progress = vim.defaulttable()
-- vim.api.nvim_create_autocmd("LspProgress", {
-- 	---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
-- 	callback = function(ev)
-- 		local client = vim.lsp.get_client_by_id(ev.data.client_id)
-- 		local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
-- 		if not client or type(value) ~= "table" then
-- 			return
-- 		end
-- 		local p = progress[client.id]
--
-- 		for i = 1, #p + 1 do
-- 			if i == #p + 1 or p[i].token == ev.data.params.token then
-- 				p[i] = {
-- 					token = ev.data.params.token,
-- 					msg = ("[%3d%%] %s%s"):format(
-- 						value.kind == "end" and 100 or value.percentage or 100,
-- 						value.title or "",
-- 						value.message and (" **%s**"):format(value.message) or ""
-- 					),
-- 					done = value.kind == "end",
-- 				}
-- 				break
-- 			end
-- 		end
--
-- 		local msg = {} ---@type string[]
-- 		progress[client.id] = vim.tbl_filter(function(v)
-- 			return table.insert(msg, v.msg) or not v.done
-- 		end, p)
--
-- 		local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
-- 		vim.notify(table.concat(msg, "\n"), "info", {
-- 			id = "lsp_progress",
-- 			title = client.name,
-- 			opts = function(notif)
-- 				notif.icon = #progress[client.id] == 0 and " "
-- 					or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
-- 			end,
-- 		})
-- 	end,
-- })

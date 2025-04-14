local utils = require("heirline.utils")
local conditions = require("heirline.conditions")

-- local function setup_colors()
-- 	return {
-- 		bright_bg = utils.get_highlight("Folded").bg, --light blackground
-- 		bright_fg = utils.get_highlight("Folded").fg,
-- 		red = utils.get_highlight("DiagnosticError").fg, --red
-- 		dark_red = utils.get_highlight("DiffDelete").bg, --dark_red
-- 		green = utils.get_highlight("String").fg, --green
-- 		blue = utils.get_highlight("Function").fg, --green
-- 		gray = utils.get_highlight("NonText").fg, --gray
-- 		orange = utils.get_highlight("Constant").fg, --Pink
-- 		purple = utils.get_highlight("Statement").fg,
-- 		cyan = utils.get_highlight("Special").fg, -- orange
-- 		diag_warn = utils.get_highlight("DiagnosticWarn").fg, --yellow
-- 		diag_error = utils.get_highlight("DiagnosticError").fg, --red
-- 		diag_hint = utils.get_highlight("DiagnosticHint").fg, --green
-- 		diag_info = utils.get_highlight("DiagnosticInfo").fg,
-- 		git_del = utils.get_highlight("diffDeleted").fg,
-- 		git_add = utils.get_highlight("diffAdded").fg,
-- 		git_change = utils.get_highlight("diffChanged").fg,
-- 	}
-- end
local function setup_colors()
	return {
		bg = utils.get_highlight("BufferLineBackground").bg,
		fg = utils.get_highlight("BufferLineBackground").fg,

		bright_bg = utils.get_highlight("Folded").bg,
		bright_fg = utils.get_highlight("Folded").fg,
		red = utils.get_highlight("DiagnosticError").fg,
		dark_red = utils.get_highlight("DiffDelete").bg,
		green = utils.get_highlight("String").fg,
		blue = utils.get_highlight("Function").fg,
		gray = utils.get_highlight("NonText").fg,
		orange = utils.get_highlight("Constant").fg,
		purple = utils.get_highlight("Statement").fg,
		cyan = utils.get_highlight("Special").fg,
		diag_warn = utils.get_highlight("DiagnosticWarn").fg,
		diag_error = utils.get_highlight("DiagnosticError").fg,
		diag_hint = utils.get_highlight("DiagnosticHint").fg,
		diag_info = utils.get_highlight("DiagnosticInfo").fg,
		git_del = utils.get_highlight("diffDeleted").fg,
		git_add = utils.get_highlight("diffAdded").fg,
		git_change = utils.get_highlight("diffChanged").fg,
	}
end
require("heirline").load_colors(setup_colors())
-- or pass it to config.opts.colors

vim.api.nvim_create_augroup("Heirline", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		utils.on_colorscheme(setup_colors)
	end,
	group = "Heirline",
})

--- colorset end, ""
M = {}
M.Spacer = { provider = " " }
M.Fill = { provider = "%=" }
M.RightCircle = {
	provider = "█",
	hl = { fg = "red", bg = "bright_bg" },
}

M.LeftCircle = {
	provider = "",
	hl = { fg = "bright_bg", bg = "bright_bg" },
}
M.RightPadding = function(child, num_space)
	local result = {
		condition = child.condition,
		child,
		M.Spacer,
	}
	if num_space ~= nil then
		for _ = 2, num_space do
			table.insert(result, M.Spacer)
		end
	end
	return result
end
M.Mode = {
	-- get vim current mode, this information will be required by the provider
	-- and the highlight functions, so we compute it only once per component
	-- evaluation and store it as a component attribute
	init = function(self)
		self.mode = vim.fn.mode(1) -- :h mode()
	end,
	priority = 100,
	-- Now we define some dictionaries to map the output of mode() to the
	-- corresponding string and color. We can put these into `static` to compute
	-- them at initialisation time.
	static = {
		mode_names = { -- change the strings if you like it vvvvverbose!
			n = "N",
			no = "N?",
			nov = "N?",
			noV = "N?",
			["no\22"] = "N?",
			niI = "Ni",
			niR = "Nr",
			niV = "Nv",
			nt = "Nt",
			v = "V",
			vs = "Vs",
			V = "V_",
			Vs = "Vs",
			["\22"] = "^V",
			["\22s"] = "^V",
			s = "S",
			S = "S_",
			["\19"] = "^S",
			i = "I",
			ic = "Ic",
			ix = "Ix",
			R = "R",
			Rc = "Rc",
			Rx = "Rx",
			Rv = "Rv",
			Rvc = "Rv",
			Rvx = "Rv",
			c = "C",
			cv = "Ex",
			r = "...",
			rm = "M",
			["r?"] = "?",
			["!"] = "!",
			t = "T",
		},
		mode_colors = {
			n = "red",
			i = "green",
			v = "cyan",
			V = "cyan",
			["\22"] = "cyan",
			c = "orange",
			s = "purple",
			S = "purple",
			["\19"] = "purple",
			R = "orange",
			r = "orange",
			["!"] = "red",
			t = "red",
		},
	},
	-- We can now access the value of mode() that, by now, would have been
	-- computed by `init()` and use it to index our strings dictionary.
	-- note how `static` fields become just regular attributes once the
	-- component is instantiated.
	-- To be extra meticulous, we can also add some vim statusline syntax to
	-- control the padding and make sure our string is always at least 2
	-- characters long. Plus a nice Icon.
	provider = function(self)
		return " %2(" .. self.mode_names[self.mode] .. "%)"
	end,
	-- Same goes for the highlight. Now the foreground will change according to the current mode.
	hl = function(self)
		local mode = self.mode:sub(1, 1) -- get only the first mode character
		return { fg = self.mode_colors[mode], bold = true }
	end,
	-- Re-evaluate the component only on ModeChanged event!
	-- Also allows the statusline to be re-evaluated when entering operator-pending mode
	update = {
		"ModeChanged",
		pattern = "*:*",
		callback = vim.schedule_wrap(function()
			vim.cmd("redrawstatus")
		end),
	},
}

M.Mode = utils.surround({ "", "" }, "bright_bg", { M.Mode })

local FileNameBlock = {
	-- let's first set up some attributes needed by this component and its children
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(0)
	end,
}

-- 添加分隔符（类似原来的 utils.surround）
M.FileNameBlock = utils.surround({ "", "" }, "bright_bg", { M.FileNameBlock })
-- We can now define some children separately and add them later

local FileIcon = {
	init = function(self)
		local filename = self.filename
		local extension = vim.fn.fnamemodify(filename, ":e")
		self.icon, self.icon_color =
			require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
	end,
	provider = function(self)
		return self.icon and (self.icon .. " ")
	end,
	hl = function(self)
		return { fg = self.icon_color }
	end,
}

local FileName = {
	provider = function(self)
		-- first, trim the pattern relative to the current directory. For other
		-- options, see :h filename-modifers
		local filename = vim.fn.fnamemodify(self.filename, ":.")
		if filename == "" then
			return "[No Name]"
		end
		-- now, if the filename would occupy more than 1/4th of the available
		-- space, we trim the file path to its initials
		-- See Flexible Components section below for dynamic truncation
		if not conditions.width_percent_below(#filename, 0.25) then
			filename = vim.fn.pathshorten(filename)
		end
		return filename
	end,

	--	hl = { fg = utils.get_highlight("Directory").fg },
	hl = { bold = true },
}

local FileFlags = {
	{
		condition = function()
			return vim.bo.modified
		end,
		provider = "[+]",
		hl = { fg = "green" },
	},
}

-- local FileFlags = {
-- 	{
-- 		condition = function()
-- 			return vim.bo.modified
-- 		end,
-- 		provider = "  ",
-- 		hl = { fg = "red" },
-- 	},
--
-- }
-- Now, let's say that we want the filename color to change if the buffer is
-- modified. Of course, we could do that directly using the FileName.hl field,
-- but we'll see how easy it is to alter existing components using a "modifier"
-- component

local FileNameModifer = {
	hl = function()
		if vim.bo.modified then
			-- use `force` because we need to override the child's hl foreground
			return { fg = "purple", bold = true, force = true }
		end
	end,
}

--let's add the children to our FileNameBlock component
M.FileNameBlock = utils.insert(
	FileNameBlock,
	FileIcon,
	utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
	FileFlags
)

--M.FileNameBlock = utils.surround({ "", "" }, "bright_bg", { M.FileNameBlock })

M.FileType = {
	provider = function()
		return string.upper(vim.bo.filetype)
	end,
	hl = { fg = utils.get_highlight("Type").fg, bold = true },
}
-- local FileEncoding = {
-- 	provider = function()
-- 		local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc -- :h 'enc'
-- 		return enc ~= "utf-8" and enc:upper()
-- 	end,
-- }
-- local FileFormat = {
-- 	provider = function()
-- 		local fmt = vim.bo.fileformat
-- 		return fmt ~= "unix" and fmt:upper()
-- 	end,
-- }
local FileSize = {
	provider = function()
		-- stackoverflow, compute human readable file size
		local suffix = { "b", "k", "M", "G", "T", "P", "E" }
		local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
		fsize = (fsize < 0 and 0) or fsize
		if fsize < 1024 then
			return fsize .. suffix[1]
		end
		local i = math.floor((math.log(fsize) / math.log(1024)))
		return string.format("%.2g%s", fsize / math.pow(1024, i), suffix[i + 1])
	end,
	hl = { fg = "cyan" },
}
local FileLastModified = {
	-- did you know? Vim is full of functions!
	provider = function()
		local ftime = vim.fn.getftime(vim.api.nvim_buf_get_name(0))
		return (ftime > 0) and os.date("%c", ftime)
	end,
	hl = { fg = "blue" },
}

M.FileDetails = {
	FileSize,
	M.Spacer,
	FileLastModified,
}

-- We're getting minimalist here!
M.Ruler = {
	-- %l = current line number
	-- %L = number of lines in the buffer
	-- %c = column number
	-- %P = percentage through file of displayed window
	{ provider = "%7(%l/%3L%):%2c %P" },

	{ provider = " " },
	-- hl = {
	-- 	fg = "blue",
	-- 	bg = "bright_bg",
	-- },
}
--, ""█
--M.Ruler = utils.surround({ "█", "" }, "purple", { M.Ruler })
-- I take no credits for this! 🦁
M.ScrollBar = {
	static = {
		sbar = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" },
		-- Another variant, because the more choice the better.
		-- sbar = { '🭶', '🭷', 🭸', '🭹', '🭺', '🭻' }
	},
	provider = function(self)
		local curr_line = vim.api.nvim_win_get_cursor(0)[1]
		local lines = vim.api.nvim_buf_line_count(0)
		local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
		return string.rep(self.sbar[i], 2)
	end,
	hl = { fg = "red", bg = "bright_bg" },
}
M.LSPActive = {
	condition = conditions.lsp_attached,
	update = { "LspAttach", "LspDetach" },

	-- You can keep it simple,
	-- provider = " [LSP]",

	-- Or complicate things a bit and get the servers names
	provider = function()
		local names = {}
		for i, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
			table.insert(names, server.name)
		end
		return " [" .. table.concat(names, " ") .. "]"
	end,
	hl = { fg = "green", bold = true },
}
M.Diagnostics = {

	condition = conditions.has_diagnostics,

	static = {
		error_icon = " ",
		warn_icon = "󰀧 ",
		info_icon = "󱂷 ",
		hint_icon = " ",
	},

	init = function(self)
		self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
		self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
		self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	end,

	update = { "DiagnosticChanged", "BufEnter" },

	{
		provider = "🙵 [",
		hl = { bold = true },
	},
	{
		provider = function(self)
			-- 0 is just another output, we can decide to print it or not!
			return self.errors > 0 and (self.error_icon .. self.errors .. " ")
		end,
		hl = { fg = "diag_error" },
	},
	{
		provider = function(self)
			return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
		end,
		hl = { fg = "diag_warn" },
	},
	{
		provider = function(self)
			return self.info > 0 and (self.info_icon .. self.info .. " ")
		end,
		hl = { fg = "diag_info" },
	},
	{
		provider = function(self)
			return self.hints > 0 and (self.hint_icon .. self.hints)
		end,
		hl = { fg = "diag_hint" },
	},
	{
		provider = "]",
		hl = { bold = true },
	},
}

M.Git = {
	condition = conditions.is_git_repo,

	init = function(self)
		self.status_dict = vim.b.gitsigns_status_dict
		self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
	end,

	hl = { fg = "orange" },

	{ -- git branch name
		provider = function(self)
			return " " .. self.status_dict.head
		end,
		hl = { bold = true },
	},
	-- You could handle delimiters, icons and counts similar to Diagnostics
	{
		condition = function(self)
			return self.has_changes
		end,
		provider = "(",
	},
	{
		provider = function(self)
			local count = self.status_dict.added or 0
			return count > 0 and ("+" .. count)
		end,
		--hl = { fg = "diag_info" },
		hl = { fg = "diag_info" },
	},
	{
		provider = function(self)
			local count = self.status_dict.removed or 0
			return count > 0 and ("-" .. count)
		end,
		hl = { fg = "diag_error" },
	},
	{
		provider = function(self)
			local count = self.status_dict.changed or 0
			return count > 0 and ("~" .. count)
		end,
		hl = { fg = "diag_warn" },
	},
	{
		condition = function(self)
			return self.has_changes
		end,
		provider = ")",
	},
}
M.WorkDir = {
	provider = function()
		local icon = (vim.fn.haslocaldir(0) == 1 and "󰰍 " or " ") .. " " .. " "
		local cwd = vim.fn.getcwd(0)
		cwd = vim.fn.fnamemodify(cwd, ":~")
		if not conditions.width_percent_below(#cwd, 0.25) then
			cwd = vim.fn.pathshorten(cwd)
		end
		local trail = cwd:sub(-1) == "/" and "" or "/"
		return icon .. cwd .. trail
	end,
	hl = { fg = "blue", bold = true },
}
M.SearchCount = {
	condition = function()
		return vim.v.hlsearch ~= 0 and vim.o.cmdheight == 0
	end,
	init = function(self)
		local ok, search = pcall(vim.fn.searchcount)
		if ok and search.total then
			self.search = search
		end
	end,
	provider = function(self)
		local search = self.search
		return string.format("[%d/%d]", search.current, math.min(search.total, search.maxcount))
	end,
}
M.MacroRec = {
	condition = function()
		return vim.fn.reg_recording() ~= "" and vim.o.cmdheight == 0
	end,
	provider = " ",
	hl = { fg = "orange", bold = true },
	utils.surround({ "[", "]" }, nil, {
		provider = function()
			return vim.fn.reg_recording()
		end,
		hl = { fg = "green", bold = true },
	}),
	update = {
		"RecordingEnter",
		"RecordingLeave",
	},
}

M.Spell = {
	condition = function()
		return vim.wo.spell
	end,
	provider = "SPELL ",
	hl = { bold = true, fg = "orange" },
}
return M

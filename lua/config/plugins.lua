-- Plugin configuration loader for vim.pack
-- This file loads and configures all plugins after they've been added via vim.pack.add()

local M = {}

-- Helper function to safely require and setup a plugin
local function safe_setup(module_name, config_func)
	local ok, module = pcall(require, module_name)
	if ok and config_func then
		local setup_ok, err = pcall(config_func, module)
		if not setup_ok then
			vim.notify("Error setting up " .. module_name .. ": " .. tostring(err), vim.log.levels.ERROR)
		end
	elseif not ok then
		vim.notify("Failed to load module: " .. module_name, vim.log.levels.WARN)
	end
	return ok
end

-- Load plugin configurations
function M.load_configs()
	-- Load plugin configs from the plugins directory
	-- These files should now export a setup function instead of lazy.nvim specs

	-- Core plugins that need to be loaded first
	local core_plugins = {
		"nvim-web-devicons",
		"plenary",
	}

	-- Configure core plugins silently
	for _, plugin in ipairs(core_plugins) do
		pcall(require, plugin)
	end

	-- Colorscheme
	pcall(vim.cmd, "colorscheme whale")

	-- LSP Configuration
	safe_setup("mason", function(mason)
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
	end)

	safe_setup("mason-tool-installer", function(installer)
		installer.setup({
			ensure_installed = {
				"stylua",
				"prettier",
				"clang-format",
			},
		})
	end)

	-- LSP Config
	safe_setup("lspconfig", function()
		-- Enable LSP servers
		vim.lsp.enable("clangd")
		vim.lsp.enable("rust_analyzer")
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("ruff")
		vim.lsp.enable("gopls")

		-- LSP keymaps
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				opts.desc = "See available code actions"
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Smart rename"
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				opts.desc = "Show documentation for what is under cursor"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})
	end)

	-- Treesitter
	local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
	if treesitter_ok then
		treesitter.setup({
			ensure_installed = {
				"go", "c", "lua", "vim", "vimdoc", "query",
				"python", "rust", "javascript", "html", "cpp", "regex",
			},
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
		vim.wo.foldlevel = 99
	end

	-- Completion (blink.cmp)
	safe_setup("blink.cmp", function(blink)
		blink.setup({
			fuzzy = {
				use_typo_resistance = true,
				frecency = { enabled = true },
				use_proximity = true,
				prebuilt_binaries = {
					download = true,
					force_version = nil,
				},
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
				list = { selection = { preselect = false, auto_insert = true } },
			},
			signature = {
				enabled = true,
			},
		})
	end)

	-- File explorers
	safe_setup("nvim-tree", function(tree)
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		
		tree.setup({
			view = {
				width = 35,
				relativenumber = true,
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "",
							arrow_open = "",
						},
					},
				},
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})

		-- Keymaps
		local keymap = vim.keymap
		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
		keymap.set("n", "<leader>ed", "<cmd>NvimTreeFindFileToggle!<CR>", { desc = "Toggle file explorer at current file's directory" })
	end)

	safe_setup("oil", function(oil)
		oil.setup({
			skip_confirm_for_simple_edits = true,
			delete_to_trash = false,
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
			view_options = {
				show_hidden = false,
				natural_order = true,
			},
		})
		vim.keymap.set("n", "-", ":Oil<CR>", { desc = "Open Oil file manager" })
	end)

	-- Git
	safe_setup("gitsigns", function(gitsigns)
		gitsigns.setup({
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
				end

				-- Navigation
				map("n", "]h", gs.next_hunk, "Next Hunk")
				map("n", "[h", gs.prev_hunk, "Prev Hunk")

				-- Actions
				map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
				map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Stage hunk")
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Reset hunk")

				map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
				map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")
				map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
				map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")

				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end, "Blame line")
				map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line blame")

				map("n", "<leader>hd", gs.diffthis, "Diff this")
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end, "Diff this ~")

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
			end,
		})
	end)

	-- UI
	safe_setup("lualine", function(lualine)
		local colors = {
			bg = "#51afef",
			fg = "#F7F9FF",
			yellow = "#ECBE7B",
			cyan = "#008080",
			green = "#98be65",
			orange = "#E68C32",
			red = "#ec5f67",
		}

		local theme = {
			normal = {
				a = { fg = colors.fg, bg = colors.bg },
				b = { fg = colors.fg, bg = colors.bg },
				c = { fg = colors.fg, bg = colors.bg },
			},
			insert = { a = { fg = colors.fg, bg = colors.green } },
			visual = { a = { fg = colors.fg, bg = colors.orange } },
			replace = { a = { fg = colors.fg, bg = colors.red } },
		}

		local function process_sections(sections)
			for name, section in pairs(sections) do
				local left = name:sub(-1) ~= "x" and name:sub(-1) ~= "y" and name ~= "lualine_z"
				for id, comp in ipairs(section) do
					if type(comp) ~= "table" then
						comp = { comp }
						section[id] = comp
					end
					comp.separator = left and { right = "" } or { left = "" }
				end
			end
			return sections
		end

		lualine.setup({
			options = {
				theme = theme,
				component_separators = "",
				section_separators = { left = "", right = "" },
			},
			sections = process_sections({
				lualine_a = { "mode" },
				lualine_b = {
					{ "branch", icon = "🌿" },
					{
						"diff",
						symbols = { added = "➕ ", modified = "✏️ ", removed = "➖ " },
					},
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						sections = { "error", "warn", "info" },
						symbols = { error = "❎ ", warn = "⚠️ ", info = "ℹ️ " },
					},
					{
						"filename",
						file_status = true,
						path = 1,
						symbols = { modified = "✏️  ", readonly = "🔒 " },
					},
				},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {
					{
						function()
							local msg = "💤"
							local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
							local clients = vim.lsp.get_clients()
							if next(clients) == nil then
								return msg
							end
							for _, client in ipairs(clients) do
								local filetypes = client.config.filetypes
								if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
									return "🔧 " .. client.name
								end
							end
							return msg
						end,
					},
					"filetype",
				},
				lualine_z = { "📍 %l:%c", "📊 %p%%/%L" },
			}),
			inactive_sections = {
				lualine_c = { "%f %y" },
				lualine_x = {},
			},
		})
	end)

	-- Flash navigation
	safe_setup("flash", function(flash)
		flash.setup({})

		-- Flash keymaps
		vim.keymap.set({ "n", "x", "o" }, "s", function()
			require("flash").jump()
		end, { desc = "Flash" })

		vim.keymap.set({ "n", "x", "o" }, "S", function()
			require("flash").treesitter()
		end, { desc = "Flash Treesitter" })

		vim.keymap.set("o", "r", function()
			require("flash").remote()
		end, { desc = "Remote Flash" })

		vim.keymap.set({ "o", "x" }, "R", function()
			require("flash").treesitter_search()
		end, { desc = "Treesitter Search" })

		vim.keymap.set("c", "<c-s>", function()
			require("flash").toggle()
		end, { desc = "Toggle Flash Search" })
	end)

	-- Surround
	safe_setup("nvim-surround", function(surround)
		surround.setup({})
	end)

	-- Marks
	safe_setup("marks", function(marks)
		marks.setup({})
	end)

	-- Todo comments
	safe_setup("todo-comments", function(todo)
		todo.setup({})
	end)

	-- Trouble
	safe_setup("trouble", function(trouble)
		trouble.setup({
			focus = true,
		})
		
		-- Keymaps
		vim.keymap.set("n", "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Open trouble workspace diagnostics" })
		vim.keymap.set("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Open trouble document diagnostics" })
		vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", { desc = "Open trouble quickfix list" })
		vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", { desc = "Open trouble location list" })
		vim.keymap.set("n", "<leader>xt", "<cmd>Trouble todo toggle<CR>", { desc = "Open todos in trouble" })
	end)

	-- UFO (folding)
	safe_setup("ufo", function(ufo)
		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
		vim.o.fillchars = [[eob: ,fold: ,foldopen:▾,foldsep: ,foldclose:▸]]

		local handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local suffix = (" 🡗 %d "):format(endLnum - lnum)
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0
			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth)
					local hlGroup = chunk[2]
					table.insert(newVirtText, { chunkText, hlGroup })
					chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end
			table.insert(newVirtText, { suffix, "MoreMsg" })
			return newVirtText
		end

		ufo.setup({
			fold_virt_text_handler = handler,
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		})
	end)

	-- Terminal
	safe_setup("toggleterm", function(toggleterm)
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

		toggleterm.setup({
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
	end)

	-- Session management
	safe_setup("resession", function(resession)
		resession.setup({})
	end)

	-- Indent guides
	safe_setup("ibl", function(ibl)
		ibl.setup({})
	end)

	-- Guess indent
	safe_setup("guess-indent", function(guess)
		guess.setup({})
	end)

	-- AI assistants
	safe_setup("supermaven-nvim", function(supermaven)
		supermaven.setup({
			keymaps = {
				accept_suggestion = "<Tab>",
				clear_suggestion = "<C-X>",
				accept_word = "<C-j>",
			},
		})
	end)

	-- Go support
	safe_setup("go", function(go)
		go.setup({})
	end)

	-- Barbar (buffer tabs)
	safe_setup("barbar", function()
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
	end)

	-- Incline (floating statuslines)
	safe_setup("incline", function(incline)
		incline.setup({})
	end)

	-- Snacks
	safe_setup("snacks", function(snacks)
		snacks.setup({})
	end)

	-- Modes (highlight mode changes)
	safe_setup("modes", function(modes)
		modes.setup({})
	end)

	-- Comfy line numbers
	safe_setup("comfy-line-numbers", function(comfy)
		comfy.setup({})
	end)

	-- Diffview
	safe_setup("diffview", function(diffview)
		diffview.setup({})
	end)

	-- Grug-far (search and replace)
	safe_setup("grug-far", function(grug)
		grug.setup({})
	end)

	-- Render markdown
	safe_setup("render-markdown", function(render)
		render.setup({})
	end)

	-- Image support (requires ImageMagick or similar)
	-- Note: image.nvim may not work in all terminals
	-- Skip setup if not available to prevent errors
	local image_ok = pcall(require, "image")
	if image_ok then
		safe_setup("image", function(image)
			image.setup({})
		end)
	end

	-- Leetcode
	safe_setup("leetcode", function(leetcode)
		leetcode.setup({})
	end)

	-- Diagnostics
	safe_setup("tiny-inline-diagnostic", function(diagnostic)
		diagnostic.setup({})
	end)

	-- Whitespace
	safe_setup("whitespace-nvim", function(whitespace)
		whitespace.setup({})
	end)

	-- Formatting
	safe_setup("conform", function(conform)
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				go = { "gofmt" },
			},
			formatters = {
				clang_format = {
					prepend_args = { "--style=file", "--fallback-style=Google" },
				},
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end)

	-- Linting
	safe_setup("lint", function(lint)
		lint.linters_by_ft = {}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end)

	-- Mini.clue (which-key alternative)
	safe_setup("mini.clue", function(miniclue)
		miniclue.setup({
			window = {
				config = {
					width = "auto",
				},
			},
			triggers = {
				-- Leader triggers
				{ mode = "n", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },

				-- Built-in completion
				{ mode = "i", keys = "<C-x>" },

				-- `g` key
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },

				-- Marks
				{ mode = "n", keys = "'" },
				{ mode = "n", keys = "`" },
				{ mode = "x", keys = "'" },
				{ mode = "x", keys = "`" },

				-- Registers
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },

				-- Window commands
				{ mode = "n", keys = "<C-w>" },

				-- `z` key
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },
			},

			clues = {
				miniclue.gen_clues.builtin_completion(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.marks(),
				miniclue.gen_clues.registers(),
				miniclue.gen_clues.windows(),
				miniclue.gen_clues.z(),
			},
		})
	end)

	-- Telescope
	safe_setup("telescope", function(telescope)
		telescope.setup({})
	end)

	-- Lazydev for Lua LSP
	safe_setup("lazydev", function(lazydev)
		lazydev.setup({})
	end)

	-- LSP file operations
	safe_setup("lsp-file-operations", function(ops)
		ops.setup({})
	end)

	print("All plugins loaded successfully!")
end

return M

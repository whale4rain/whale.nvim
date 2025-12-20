return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		-- 颜色配置：统一蓝色底色
		local colors = {
			bg = "#51afef", -- 统一底色
			fg = "#F7F9FF", -- 主文字颜色
			yellow = "#ECBE7B",
			cyan = "#008080",
			green = "#98be65",
			orange = "#E68C32",
			red = "#ec5f67",
		}

		-- 主题配置：统一蓝色背景
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

		-- 处理 sections 添加方形分隔符
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

		-- Config - 采用 slanted-gaps 风格，但用方形分隔符
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
	end,
}

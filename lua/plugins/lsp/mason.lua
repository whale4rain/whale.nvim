return {
	"williamboman/mason.nvim",

	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		mason_tool_installer.setup({
			ensure_installed = {
				"stylua",
				"prettier",
				"clang-format",
			},
		})

		-- 1. 配置 lspconfig (通过 mason-lspconfig)
		-- mason_lspconfig.setup({
		--
		-- 	ensure_installed = {
		-- 		-- "lua_ls",
		-- 		-- "clangd",
		-- 		-- "rust_analyzer",
		-- 		-- "ruff",
		-- 		-- "gopls",
		-- 	},
		-- 	handlers = {
		-- 		-- 默认配置
		-- 		function(server_name)
		-- 			lspconfig[server_name].setup({})
		-- 		end,
		-- 	},
		-- })
	end,
}

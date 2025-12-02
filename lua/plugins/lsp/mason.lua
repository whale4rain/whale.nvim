return {
	"williamboman/mason.nvim",

	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

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
		mason_lspconfig.setup({
			ensure_installed = {
				"ruff",
				"rust_analyzer",
				"clangd",
				"lua_ls",
			},
		})
		mason_tool_installer.setup({
			ensure_installed = {
				"stylua",
				"prettier",
				"clang-format",
			},
		})
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local neodev = require("neodev")

		-- 启用 neodev 来增强 Neovim Lua 运行时环境的诊断
		neodev.setup({})

		-- 1. 配置 lspconfig (通过 mason-lspconfig)
		mason_lspconfig.setup({

			ensure_installed = {
				"lua_ls",
				"clangd",
				"rust_analyzer",
				"ruff",
			},
			handlers = {
				-- 默认配置
				function(server_name)
					lspconfig[server_name].setup({})
				end,

				-- 为 lua_ls 提供特定配置
				-- ["lua_ls"] = function()
				-- 	lspconfig.lua_ls.setup({
				-- 		settings = {
				-- 			lua = {
				-- 				diagnostics = {
				-- 					globals = { "vim", "require" },
				-- 				},
				-- 			},
				-- 		},
				-- 	})
				-- end,
			},
		})
	end,
}

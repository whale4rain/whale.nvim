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
				"isort",
				"flake8",
				"black",
				"clang-format",
			},
		})
	end,
}

-- Native vim.pack package manager configuration
-- This replaces the old lazy.nvim setup

-- Set leaders before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Plugin specifications for vim.pack.add()
local plugins = {
	-- Colorschemes
	{ "whale4rain/blue-whale.nvim" },
	{ "ramojus/mellifluous.nvim" },

	-- Core dependencies
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-tree/nvim-web-devicons" },
	{ "MunifTanjim/nui.nvim" },

	-- LSP & Completion
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ "folke/lazydev.nvim" },
	{ "antosha417/nvim-lsp-file-operations" },
	{ "saghen/blink.cmp" },
	{ "rafamadriz/friendly-snippets" },

	-- Formatting & Linting
	{ "stevearc/conform.nvim" },
	{ "mfussenegger/nvim-lint" },

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter" },

	-- File Explorer & Navigation
	{ "nvim-tree/nvim-tree.lua" },
	{ "stevearc/oil.nvim" },
	{ "nvim-telescope/telescope.nvim" },

	-- Git Integration
	{ "lewis6991/gitsigns.nvim" },
	{ "sindrets/diffview.nvim" },

	-- UI Enhancements
	{ "nvim-lualine/lualine.nvim" },
	{ "romgrk/barbar.nvim" },
	{ "b0o/incline.nvim" },
	{ "folke/snacks.nvim" },
	{ "mvllow/modes.nvim" },
	{ "mluders/comfy-line-numbers.nvim" },

	-- Code Navigation & Editing
	{ "folke/flash.nvim" },
	{ "kylechui/nvim-surround" },
	{ "abecodes/tabout.nvim" },
	{ "echasnovski/mini.pairs" },
	{ "nmac427/guess-indent.nvim" },
	{ "kevinhwang91/nvim-ufo" },
	{ "kevinhwang91/promise-async" },

	-- Productivity
	{ "folke/which-key.nvim" },
	{ "echasnovski/mini.clue" },
	{ "chentoast/marks.nvim" },
	{ "folke/todo-comments.nvim" },
	{ "folke/trouble.nvim" },
	{ "MagicDuck/grug-far.nvim" },
	{ "johnfrankmorgan/whitespace.nvim" },
	{ "lukas-reineke/indent-blankline.nvim" },

	-- Session Management
	{ "stevearc/resession.nvim" },

	-- Terminal
	{ "akinsho/toggleterm.nvim" },

	-- Markdown & Documentation
	{ "MeanderingProgrammer/render-markdown.nvim" },
	{ "3rd/image.nvim" },

	-- Language Specific
	{ "ray-x/go.nvim" },
	{ "ray-x/guihua.lua" },
	{ "kawre/leetcode.nvim" },

	-- AI Assistants
	{ "supermaven-inc/supermaven-nvim" },
	{ "github/copilot.vim" },

	-- Diagnostics
	{ "rachartier/tiny-inline-diagnostic.nvim" },
	{ "sontungexpt/sttusline" },
}

-- Add all plugins using vim.pack.add()
local function setup_plugins()
	local specs = {}

	for _, plugin in ipairs(plugins) do
		local url
		if type(plugin) == "string" then
			url = "https://github.com/" .. plugin
		else
			url = "https://github.com/" .. plugin[1]
		end

		table.insert(specs, url)
	end

	-- Add all plugins
	vim.pack.add(specs)
end

-- Install plugins on first run
local function ensure_plugins()
	local pack_path = vim.fn.stdpath("data") .. "/pack"
	local plugins_exist = vim.fn.isdirectory(pack_path) == 1

	if not plugins_exist then
		print("Installing plugins for the first time...")
		vim.fn.mkdir(pack_path, "p")
	end

	setup_plugins()

	if not plugins_exist then
		print("Plugins installed! Please restart Neovim.")
	end
end

-- Initialize plugin system
ensure_plugins()

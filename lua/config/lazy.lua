-- Bootstrap lazy.nvim
--https://youtu.be/6pAG3BHurdM
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- 设置for Neovide
if vim.g.neovide then
	-- 字体
	vim.o.guifont = "FiraCode Nerd Font Mono:h11"

	-- 透明
	vim.g.neovide_opacity = 0.7
	vim.g.neovide_normal_opacity = 0.7
	-- 窗口颜色
	vim.g.neovide_title_background_color = "#282828"
	-- string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)
	vim.g.neovide_title_text_color = "#ebdbb2"
	-- 无空闲
	vim.g.neovide_no_idle = true
	-- 记住窗口大小
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_cursor_hack = true
	vim.g.neovide_input_ime = false

	vim.g.neovide_cursor_animate_command_line = true
	vim.g.neovide_cursor_vfx_mode = "wireframe"
end

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
		{ import = "config.colorscheme" },
		{ import = "plugins.lsp" },
		--{import = "plugins.nvim-treesitter"},
		--{import = "plugins.nvim-treesitter-context"},
		--{import = "plugins.lsp.mason"},
		--{import = "plugins.lsp.lspconfig"},
		--{import = "plugins.telescope"},
		--{import = "plugins.nvim-cmp"},
	},
	opt = { colorscheme = "gruvbox" },
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "gruvbox" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

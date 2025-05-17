local opt = vim.opt

-- Hint: use `:h <option>` to figure out the meaning if needed
opt.clipboard = "unnamedplus" -- use system clipboard
opt.completeopt = { "menu", "menuone", "noselect" }
opt.mouse = "a" -- allow the mouse to be used in Nvim

-- Tab
opt.autoindent = true
opt.tabstop = 4 -- number of visual spaces per TAB
opt.softtabstop = 4 -- number of spacesin tab when editing
opt.shiftwidth = 3 -- insert 4 spaces on a tab
opt.expandtab = true -- tabs are spaces, mainly because of python

-- UI config
opt.number = true -- show absolute number
opt.relativenumber = true -- add numbers to each line on the left side
opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
opt.splitbelow = true -- open new vertical split bottom
opt.splitright = true -- open new horizontal splits right
opt.termguicolors = true -- enabl 24-bit RGB color in the TUI
opt.showmode = false -- we are experienced, wo don't need the "-- INSERT --" mode hint
opt.signcolumn = "yes" -- always show sign column
-- Searching
opt.incsearch = true -- search as characters are entered
opt.hlsearch = false -- do not highlight matches
opt.ignorecase = true -- ignore case in searches by default
opt.smartcase = true -- but make it case sensitive if an uppercase is entered

-- whitspace characters shows
-- opt.list = true
--
-- vim.opt.listchars = {
-- 	--tab = "󰌒 ", -- 制表符
-- 	-- trail = "·", -- 行尾空格
-- 	--nbsp = "󱁐", -- 非断行空格
-- 	-- extends = "»", -- 当文本超出屏幕右侧时的指示符
-- 	-- precedes = "«", -- 当文本超出屏幕左侧时的指示符
-- 	-- space = "󱁐", -- 普通空格
-- 	-- tab = " ",
-- 	eol = "󰌑", -- 行尾换行符
-- 	--conceal = "┊", -- 被隐藏的字符
-- }

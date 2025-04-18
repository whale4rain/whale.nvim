-- define common options
----------------
--- memo  ------
--- ----------
-- 在文件树按下s可以使用vscode打开文件
-- gx跳转连接

local opts = {
	noremap = true, -- non-recursive
	silent = true, -- do not show message
}
vim.g.mapleader = " " -- set leader to space
local keymap = vim.keymap

-----------------
-- Insert mode --
-----------------

keymap.set("i", "jk", "<Esc>", opts) -- jk to escape
keymap.set("v", "u", "<Esc>", opts) -- u to escape
-----------------
-- Normal mode --
-----------------
-- 保存并退出
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Save and quit" })

-- switch $ to

keymap.set("n", "9", "$", opts)

-- Hint: see `:h vim.map.set()`
-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "split window vertically" }) -- split window vertically
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "split winodw horizontally" }) -- split window horizontally
-- Better buffer navigation
keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", { desc = "next buffer" }) -- next buffer
keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { desc = "previous buffer" }) -- previous buffer
--取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>", opts)
-- Resize with arrows
-- delta: 2 lines
keymap.set("n", "<S-Up>", ":resize -2<CR>", opts)
keymap.set("n", "<S-Down>", ":resize +2<CR>", opts)
keymap.set("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<S-Right>", ":vertical resize +2<CR>", opts)
keymap.set("n", "<leader>wd", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
-------------------
--plugin's keymap--
-------------------

keymap.set("n", "<leader>bb", "<cmd>BufferLinePick<cr>", { desc = "PiFuzzy find files in cwdck buffer" })
-- Treesitter context
vim.keymap.set("n", "[c", function()
	require("treesitter-context").go_to_context(vim.v.count1)
end, { desc = "Go to previous context" }) --- go to previous context

-- Rust 配置
vim.api.nvim_set_keymap(
	"n",
	"<leader>rff",
	"<cmd>lua vim.lsp.buf.format()<CR>",
	{ noremap = true, silent = true, desc = "Format Rust code" }
)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-----------------
---Visual Blok --
-----------------

keymap.set("x", "I", "I", opts) -- 确保 Shift + I 正常工作

-----------------
---self  made --
-----------------
--
-- keymap.set(
-- 	"n",
-- 	"<leader>cf",
-- 	":lua require('telescope.builtin').find_files({ cwd = 'C:/Users/86152/AppData/Local/nvim' })<CR>",
-- 	{ desc = "go to the config file" }
-- )
keymap.set("n", "gx", "gx", { desc = "open link undercursor" })

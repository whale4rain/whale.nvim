-- define common options
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
-- switch $ to 

keymap.set("n", "9", "$", opts)


-- Hint: see `:h vim.map.set()`
-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)
keymap.set("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
-- Better buffer navigation
keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", opts) -- next buffer
keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>", opts) -- previous buffer
keymap.set("n", "<leader>bd", ":BufferLineCloseLeft<CR>", opts) -- close buffer

--取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>", opts)
-- Resize with arrows
-- delta: 2 lines
keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)
keymap.set("n", "<leader>wd", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
-------------------
--plugin's keymap--
-------------------

-- Treesitter context
vim.keymap.set("n", "[c", function()
	require("treesitter-context").go_to_context(vim.v.count1)
end, opts) --- go to previous context

-- 在配置文件中添加以下代码
vim.api.nvim_set_keymap(
	"n",
	"<leader>rf",
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

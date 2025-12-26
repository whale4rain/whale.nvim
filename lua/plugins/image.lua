vim.pack.add({
	"https://github.com/3rd/image.nvim",
})

local image_ok = pcall(require, "image")
if image_ok then
	require("image").setup({})
end

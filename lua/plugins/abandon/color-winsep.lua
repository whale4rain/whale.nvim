return {
	"nvim-zh/colorful-winsep.nvim",
	event = { "WinLeave" },
	config = function()
		require("colorful-winsep").setup({
			hi = {
				bg = "#3c3826",
				fg = "#d65d0e",
			},
		})
	end,
}

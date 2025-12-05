return {
	"stevearc/resession.nvim",
	config = function()
		local resession = require("resession")
		resession.setup()
		-- Resession does NOTHING automagically, so we have to set up some keymaps
		vim.keymap.set("n", "<leader>ss", resession.save, { desc = "session save" })
		vim.keymap.set("n", "<leader>sl", resession.load, { desc = "session load" })
		vim.keymap.set("n", "<leader>sd", resession.delete, { desc = "delete session" })
	end,
}

vim.pack.add({
	"https://github.com/folke/sidekick.nvim.git",
})

require("sidekick").setup({})

-- Sidekick keymaps
local keymap = vim.keymap

keymap.set("n", "<tab>", function()
	-- if there is a next edit, jump to it, otherwise apply it if any
	if not require("sidekick").nes_jump_or_apply() then
		return "<Tab>" -- fallback to normal tab
	end
end, { expr = true, desc = "Goto/Apply Next Edit Suggestion" })

keymap.set({ "n", "t", "i", "x" }, "<c-.>", function()
	require("sidekick.cli").toggle()
end, { desc = "Sidekick Toggle" })

keymap.set("n", "<leader>aa", function()
	require("sidekick.cli").toggle()
end, { desc = "Sidekick Toggle CLI" })

keymap.set("n", "<leader>as", function()
	require("sidekick.cli").select()
	-- Or to select only installed tools:
	-- require("sidekick.cli").select({ filter = { installed = true } })
end, { desc = "Select CLI" })

keymap.set("n", "<leader>ad", function()
	require("sidekick.cli").close()
end, { desc = "Detach a CLI Session" })

keymap.set({ "x", "n" }, "<leader>at", function()
	require("sidekick.cli").send({ msg = "{this}" })
end, { desc = "Send This" })

keymap.set("n", "<leader>af", function()
	require("sidekick.cli").send({ msg = "{file}" })
end, { desc = "Send File" })

keymap.set("x", "<leader>av", function()
	require("sidekick.cli").send({ msg = "{selection}" })
end, { desc = "Send Visual Selection" })

keymap.set({ "n", "x" }, "<leader>ap", function()
	require("sidekick.cli").prompt()
end, { desc = "Sidekick Select Prompt" })

keymap.set("n", "<leader>ac", function()
	require("sidekick.cli").toggle({ name = "claude", focus = true })
end, { desc = "Sidekick Toggle Claude" })

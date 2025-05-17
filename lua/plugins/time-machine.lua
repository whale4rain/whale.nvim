-- time-machine.lua
return {
	"y3owk1n/time-machine.nvim",
	event = "VeryLazy",
	version = "*", -- remove this if you want to use the `main` branch
	opts = {
		-- your configuration comes
		-- or it empty to use the default sett
		-- refer to the configuration sebelow
	},
	keys = {
		{
			"<leader>tm",
			"",
			desc = "Time Machine",
		},
		{
			"<leader>tt",
			"<cmd>TimeMachineToggle<cr>",
			desc = "[Time Machine] Toggle Tree",
		},
		{
			"<leader>tx",
			"<cmd>TimeMachinePurgeCurrent<cr>",
			desc = "[Time Machine] Purge current",
		},
		{
			"<leader>tX",
			"<cmd>TimeMachinePurgeAll<cr>",
			desc = "[Time Machine] Purge all",
		},
		{
			"<leader>tl",
			"<cmd>TimeMachineLogShow<cr>",
			desc = "[Time Machine] Show log",
		},
	},
}

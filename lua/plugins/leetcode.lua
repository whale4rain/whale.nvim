return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
	dependencies = {
		"nvim-telescope/telescope.nvim",
		-- "ibhagwan/fzf-lua",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		-- configuration goes here
		cn = { -- leetcode.cn
			enabled = true, ---@type boolean
			translator = true, ---@type boolean
			translate_problems = true, ---@type boolean
		},
	},
}
-- nvim leetcode.nvim or neovide leetcode.nvim to use
--Leet opens menu dashboard
-- menu same as Leet
--
-- exit close leetcode.nvim
--
-- console opens console pop-up for currently opened question
--
-- info opens a pop-up containing information about the currently opened question
--
-- tabs opens a picker with all currently opened question tabs
--
-- yank yanks the current question solution
--
-- lang opens a picker to change the language of the current question
--
-- run run currently opened question
--
-- test same as Leet run
--
-- submit submit currently opened question
--
-- random opens a random question
--
-- daily opens the question of today
--
-- list opens a problem list picker
--
-- open opens the current question in a default browser
--
-- reset reset current question to default code definition
--
-- last_submit retrieve last submitted code for the current question
--
-- restore try to restore default question layout
--
-- inject re-inject code for the current question

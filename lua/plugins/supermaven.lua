-- ===
-- === 一个ai编程助手，号称是最快的copilot
-- ===
return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<S-CR>",
				clear_suggestion = "<C-n>",
				accept_word = "<C-i>",
			},
		})
	end,
}
--:SupermavenStart    start supermaven-nvim
--:SupermavenStop     stop supermaven-nvim
--:SupermavenRestart  restart supermaven-nvim
--:SupermavenToggle   toggle supermaven-nvim
--:SupermavenStatus   show status of supermaven-nvim
--:SupermavenUseFree  switch to the free version
--:SupermavenUsePro   switch to the pro version
--:SupermavenLogout   log out of supermaven
--:SupermavenShowLog  show logs for supermaven-nvim
--:SupermavenClearLog clear logs for supermaven-nvim

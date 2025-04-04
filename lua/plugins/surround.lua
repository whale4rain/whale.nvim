return {
	"kylechui/nvim-surround",
	event = { "BufReadPre", "BufNewFile" },
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	config = true,
}
-- use ys + where (like iw 8j) + " ` ...to add surround
-- use cs + " ` ... to change surround
-- use ds" to delete "
-- eg. ysiw" to add " to word
-- eg. yss" to add " to line

-- eg. cs"' to change ' to "
-- eg. cs'<q> to change ' to <q>

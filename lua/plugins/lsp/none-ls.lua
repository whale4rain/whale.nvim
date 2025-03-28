return {
	-- "jose-elias-alvarez/null-ls.nvim",
	"nvimtools/none-ls.nvim",
	requires = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- null_ls.builtins.formatting.rustfmt, -- 添加 rustfmt 作为格式化工具

				null_ls.builtins.formatting.clang_format, -- C/C++ 格式化
				null_ls.builtins.diagnostics.cpplint, -- C/C++ Linter (可选)

				-- null_ls.builtins.formatting.black, -- 格式化
				-- null_ls.builtins.diagnostics.pylint,
				null_ls.builtins.formatting.ruff,
				null_ls.builtins.diagnostics.ruff,
			},
		})
	end,
}

return {
	"CRAG666/code_runner.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("code_runner").setup({
			filetype = {
				java = {
					"cd $dir ;",
					"javac $fileName ;",
					"java $fileNameWithoutExt",
				},
				python = "python3 -u",
				rust = {
					"cd $dir ;",
					"rustc $fileName ;",
					"$dir/$fileNameWithoutExt",
				},
				c = function(...)
					c_base = {
						"cd $dir ;",
						"gcc $fileName -o",
						"$dir/tmp/$fileNameWithoutExt",
					}
					local c_exec = {
						"; $dir/tmp/$fileNameWithoutExt.exe ;",
						"rm $dir/tmp/$fileNameWithoutExt.exe",
					}
					vim.ui.input({ prompt = "Add more args:" }, function(input)
						c_base[4] = input
						vim.print(vim.tbl_extend("force", c_base, c_exec))
						require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
					end)
				end,
				cpp = function(...)
					cpp_base = {
						"cd $dir ;",
						"g++ $fileName -o",
						"$dir/tmp/$fileNameWithoutExt",
					}
					local cpp_exec = {
						"; $dir/tmp/$fileNameWithoutExt.exe ;",
						"rm $dir/tmp/$fileNameWithoutExt.exe",
					}
					vim.ui.input({ prompt = "Add more args:" }, function(input)
						cpp_base[4] = input
						vim.print(vim.tbl_extend("force", cpp_base, cpp_exec))
						require("code_runner.commands").run_from_fn(vim.list_extend(cpp_base, cpp_exec))
					end)
				end,
			},
		})
	end,
}

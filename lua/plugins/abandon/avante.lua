return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- 永远不要将此值设置为 "*"！永远不要！
	opts = {
		-- 在此处添加任何选项
		-- 例如
		provider = "deepseek",
		providers = {
			deepseek = {
				__inherited_from = "openai",
				api_key_name = "DEEPSEEK_API_KEY",
				endpoint = "https://api.deepseek.com",
				model = "deepseek-coder",
				max_tokens = 8100,
			},
		},
	},
	-- 如果您想从源代码构建，请执行 `make BUILD_FROM_SOURCE=true`
	build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false", -- 对于 Windows
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- 以下依赖项是可选的，
		"nvim-tree/nvim-web-devicons", -- 或 echasnovski/mini.icons
		-- {
		-- 	-- 支持图像粘贴
		-- 	"HakonHarnes/img-clip.nvim",
		-- 	event = "VeryLazy",
		-- 	opts = {
		-- 		-- 推荐设置
		-- 		default = {
		-- 			embed_image_as_base64 = false,
		-- 			prompt_for_file_name = false,
		-- 			drag_and_drop = {
		-- 				insert_mode = true,
		-- 			},
		-- 			-- Windows 用户必需
		-- 			use_absolute_path = true,
		-- 		},
		-- 	},
		-- },
		-- {
		-- 	-- 如果您有 lazy=true，请确保正确设置
		-- 	"MeanderingProgrammer/render-markdown.nvim",
		-- 	opts = {
		-- 		file_types = { "markdown", "Avante" },
		-- 	},
		-- 	ft = { "markdown", "Avante" },
		-- },
	},
}

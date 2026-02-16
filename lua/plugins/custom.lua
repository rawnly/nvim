-- my own plugins
return {
	{
		"rawnly/targetprocess.nvim",
		dev = true,
		opts = {
			base_url = vim.env.TARGET_PROCESS_API_BASE_URL,
			token = vim.env.TARGET_PROCESS_ACCESS_TOKEN,
		},
		keys = {
			{
				"<leader>tv",
				"<CMD>TargetProcessView<CR>",
				desc = "View",
			},
			{
				"<leader>to",
				"<CMD>TargetProcessOpen<CR>",
				desc = "Open",
			},
		},
	},
	{
		"rawnly/gist.nvim",
		dev = true,
		opts = {
			platform = "termbin",
		},
	},
}

return {
	{
		"folke/noice.nvim",
		enabled = false,
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			views = {
				cmdline_popup = {
					position = { row = 23 },
				},
			},
			presets = {
				lsp_doc_border = true,
			},
			lsp = {
				progress = {
					enabled = false,
				},
				hover = {
					enabled = true,
				},
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			notify = {
				view = "mini",
			},
			routes = {
				{
					filter = {
						event = "notify",
						find = "No information available",
					},
					opts = { skip = true },
				},
			},
		},
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {
			need = 1,
			branch = true,
		},
		keys = {
			{
				"<leader>qs",
				function()
					require("persistence").load()
				end,
				desc = "Load session",
			},
			{
				"<leader>qS",
				function()
					require("persistence").load()
				end,
				desc = "Pick a session",
			},
			{
				"<leader>ql",
				function()
					require("persistence").load()
				end,
				desc = "Load last session",
			},
			{
				"<leader>qd",
				function()
					require("persistence").load()
				end,
				desc = "Stop persistance",
			},
		},

		init = function()
			vim.opt.sessionoptions =
				{ "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
		end,
	},
	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		opts = {},
	},
}

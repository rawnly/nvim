---@type
return {
	"dmtrKovalenko/fff.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	build = function()
		require("fff.download").download_or_build_binary()
	end,
	opts = {
		prompt = "> ",
		icons = { enabled = false },
		layout = {
			prompt_position = "top",
			width = 0.9,
			height = 0.9,
		},
		debug = {
			enabled = false,
			show_scores = false,
		},
		keymaps = {
			move_up = { "<C-k>", "<Up>", "<C-p>" },
			move_down = { "<C-j>", "<Down>", "<C-n>" },
			-- cycle_previous_query = { "<C-p>" }
		},
		git = {
			status_text_color = true,
		},
	},
	lazy = false,
	keys = {
		{
			"<leader>ff",
			function()
				require("fff").find_files()
			end,
			desc = "FFFind files",
		},
		{
			"<leader>fw",
			function()
				require("fff").live_grep()
			end,
			desc = "FFFuzzy grep",
		},
		{
			"ff",
			function()
				require("fff").find_files()
			end,
			desc = "FFFind files",
		},
	},
}

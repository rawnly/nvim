---@type LazySpec
return {
	{
		"oskarnurm/koda.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		opts = {},
	},
	-- Lua
	{
		"f-person/auto-dark-mode.nvim",
		opts = {
			update_interval = 500,
		},
	},
	-- nightfox
	{
		"rawnly/nyx.nvim",
		dev = true,
		lazy = false,
		priority = 1000,
		opts = {
			transparent = false,
			styles = {
				keywords = {
					italic = true,
					bold = true,
				},
			},
			dim_inactive = true,
			sidebars = {
				"qf",
				"help",
			},
			plugins = { auto = true },
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
		enabled = false,
		opts = {
			style = "night",
			transparent = false,
			styles = {
				keywords = {
					italic = true,
					bold = true,
				},
			},
			dim_inactive = true,
		}, -- Or 'day'/'moon'
	},
	{
		"folke/which-key.nvim",
		keys = {
			{
				"<leader>ft",
				function()
					Snacks.picker.colorschemes()
				end,
				desc = "Search Themes",
			},
		},
	},
}

---@type LazySpec
return {
	{ "shaunsingh/moonlight.nvim" },
	{ "0xleodevv/oc-2.nvim" },
	{
		"oskarnurm/koda.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		opts = {},
	},
	-- Lua
	{
		"f-person/auto-dark-mode.nvim",
		enabled = false,
		opts = {
			update_interval = 500,
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
}

---@type LazySpec
return {
	{
		"RRethy/base16-nvim",
		lazy = false,
		priority = 1000,
		config = function() end,
	},
	{
		"wtfox/luna.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		opts = {
			options = {
				transparent = false,
				styles = {
					comments = "italic",
					keywords = "bold",
					types = "italic,bold",
				},
			},
		},
	},
	{
		"jpwol/thorn.nvim",
		priority = 1000,
		opts = {},
	},
	{
		"ember-theme/nvim",
		name = "ember",
		priority = 1000,
		opts = { variant = "ember" },
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			variant = "auto",
			transparent = false,
		},
	},
	{
		"0xleodevv/oc-2.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"oskarnurm/koda.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		opts = {},
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

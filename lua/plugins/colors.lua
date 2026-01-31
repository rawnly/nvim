---@type LazySpec
return {
	-- nightfox
	{
		"serhez/teide.nvim",
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

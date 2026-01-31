---@module "lazy.nvim"
---@type LazySpec
return {
	{
		"windwp/nvim-ts-autotag",
		lazy = true,
		event = "InsertEnter",
		opts = {
			opts = {
				enable_close_on_slash = true,
			},
		},
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		ft = { "javascript", "typescript", "typescriptreact", "javascriptreact", "vue", "svelte" },
		opts = {
			---@module "typescript-tools.nvim"
			---@class Settings
			settings = {
				tsserver_file_preferences = {
					includeInlayParameterNameHints = "all",
				},
			},
		},
	},
}

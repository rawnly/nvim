return {
	{
		"mfussenegger/nvim-lint",
		optional = true,
		opts = {
			linters_by_ft = {
				["dockerfile"] = { "hadolint" },
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			automatic_enable = true,
			ensure_installed = {
				"gopls",
				"zls",
				"biome",
				"jsonls",
				"yamlls",
				"docker_compose_language_service",
				"ruff",
				"pyright",
				-- "docker-langauge-server",
				-- "hadolint",
			},
			handlers = {
				function(server_name)
					if server_name == "tsserver" or server_name == "ts_ls" then
						return
					end

					require("lspconfig")[server_name].setup({})
				end,
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
			"b0o/schemastore.nvim",
		},
	},
}

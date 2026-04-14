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
				"stylua",
				"gopls",
				"zls",
				"biome",
				"jsonls",
				"yamlls",
				"taplo",
				"docker_compose_language_service",
				"lua_ls",
				-- "docker-language-server",
				-- "fish-lsp",
				-- "css-lsp",
				-- "rust-analyzer",
				-- "ty",
				-- "uv",
				-- "rustywind",
				-- "shellcheck",
				"jdtls",
				"ruff",
				"ty",
				-- "pyright",
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

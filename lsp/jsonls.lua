---@type vim.lsp.Config
return {
	filetypes = { "json", "yaml", "jsonc" },
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
		yaml = {
			schemaStore = {
				enable = true,
				url = "",
			},
			schemas = require("schemastore").yaml.schemas(),
			validate = { enable = true },
		},
	},
}

---@module "lazy.nvim"
---@type LazySpec
return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		opts = {
			sync_install = true,
			auto_install = true,
			highlight = { enable = true },
			ensure_installed = {
				"java",
				"kotlin",
				"lua",
				"vim",
				"rust",
				"go",
				"astro",
				"bash",
				"fish",
				"zig",
				"tsx",
				"caddy",
				"nginx",
				"yaml",
				"toml",
				"css",
				"html",
				"markdown",
				"markdown_inline",
				"typescript",
				"javascript",
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.install").prefer_git = true
		require("nvim-treesitter.config").setup(opts)

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					local buf = args.buf
					local ft = args.match

					local lang = vim.treesitter.language.get_lang(ft) or ft

					if not vim.treesitter.language.add(lang) then
						return
					end

					vim.treesitter.start(buf, lang)
					-- vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
}

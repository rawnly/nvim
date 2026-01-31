---@module "lazy.nvim"
---@type LazySpec
return {
	"b0o/schemastore.nvim",
	{
		"folke/trouble.nvim",
		-- for default options, refer to the configuration section for custom setup.
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>xl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"DNLHC/glance.nvim",
		cmd = "Glance",
		opts = {
			border = {
				enable = true,
			},
			hooks = {
				-- jump to definition if the result is just 1
				before_open = function(results, open, jump)
					if #results == 1 then
						jump(results[1])
					else
						open(results)
					end
				end,
			},
		},
		keys = {
			{ "gr", "<CMD>Glance references<CR>", desc = "Go to references" },
			{ "gd", "<CMD>Glance definitions<CR>", desc = "Go to definitions" },
		},
	},
	{
		"hedyhli/outline.nvim",
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		keys = {
			{
				"<leader>lS",
				"<cmd>Outline!<CR>",
				desc = "Show Outline",
			},
		},
		opts = {
			outline_window = {
				position = "left",
				auto_jump = true,
			},
			preview_window = {
				-- auto_preview = true,
			},
		},
	},
	{
		"folke/which-key.nvim",
		keys = {
			{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename" },
			{ "<leader>la", vim.lsp.buf.code_action, desc = "Code Actions" },
			{ "<leader>ll", vim.lsp.buf.list_workspace_folders, desc = "List workspace folders" },
			{ "<leader>ld", vim.diagnostic.open_float, desc = "Hover Diagnostics" },
			{ "<leader>li", ":LspInfo<CR><esc>", desc = "Info" },
			{
				"<leader>lh",
				function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
				end,
				desc = "Toggle inlay hints",
			},
		},
	},
	{
		"chrisgrieser/nvim-lsp-endhints",
		event = "LspAttach",
		opts = {}, -- required, even if empty
	},
}

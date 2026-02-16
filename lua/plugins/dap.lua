---@type LazySpec
return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		keys = {
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
			},
			{
				"<leader>dC",
				function()
					require("dap").run_to_cursor()()
				end,
				desc = "Run to Cursor",
			},
			{
				"<leader>dT",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate",
			},
		},
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = true,
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap",

			"jay-babu/mason-nvim-dap.nvim",
			"mfussenegger/nvim-dap-python",
			"theHamsta/nvim-dap-virtual-text",
		},
		opts = {},
		keys = {
			{
				"<leader>du",
				function()
					require("dapui").toggle({})
				end,
				desc = "UI",
			},
		},
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"mfussenegger/nvim-dap",
			"williamboman/mason.nvim",
		},
		opts = {
			handlers = {},
			automatic_installation = {
				exclude = {
					"python",
					"delve",
				},
			},
			ensure_installed = {
				"bash",
				"python",
			},
		},
	},

	-- PYTHON --
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			local python = vim.fn.expand("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
			require("dap-python").setup(python)
		end,
	},
}

---@type Terminal
local lazygit

---@type Terminal
local devserver

local function close_on_q(bufnr)
	vim.cmd("startinsert!")
	vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<cmd>close<cr>", {
		noremap = true,
		silent = true,
	})
end

local function get_lazygit()
	if not lazygit then
		local Terminal = require("toggleterm.terminal").Terminal
		lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,
			direction = "float",
			dir = "git_dir",
			display_name = "Lazygit",
			float_opts = {
				border = "double",
			},
			on_open = function(t)
				close_on_q(t.bufnr)
			end,
		})
	end

	return lazygit
end

local function get_dev_server(cmd)
	if not devserver then
		local Terminal = require("toggleterm.terminal").Terminal
		devserver = Terminal:new({
			cmd = cmd,
			hidden = true,
			close_on_exit = true,
			auto_scroll = true,
			direction = "float",
			float_opts = {
				border = "double",
			},
			on_open = function(t)
				close_on_q(t.bufnr)
			end,
		})
	end

	return devserver
end

---@type LazySpec
return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			local git = require("utils.git")
			local node = require("utils.node")

			require("toggleterm").setup({
				open_mapping = [[<c-\>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
				autochdir = true,
				direction = "horizontal",
				size = function(t)
					if t.direction == "horizontal" then
						return 20
					elseif t.direction == "vertical" then
						return vim.o.columns * 0.3
					end
				end,
			})

			if git.is_repo() then
				vim.keymap.set("n", "<leader>rl", function()
					get_lazygit():toggle()
				end, {
					desc = "lazygit",
				})
			end

			if node.manifest() ~= nil then
				local fname = node.lockfile()
				vim.notify(fname)

				if fname ~= nil then
					local runner = "npm"

					if fname:match("pnpm") then
						runner = "pnpm"
					end

					if fname:match("bun") then
						runner = "bun"
					end

					if fname:match("yarn") then
						runner = "yarn"
					end

					local cmd = runner .. " run dev"

					vim.keymap.set("n", "<leader>rd", function()
						get_dev_server(cmd):toggle()
					end, {
						desc = "dev script",
					})
				end
			end
		end,
		keys = {
			{
				"<c-\\>",
				function()
					require("toggleterm").toggle()
				end,
				desc = "Terminal",
			},
			{
				"gt",
				mode = "n",
				function()
					require("toggleterm").send_lines_to_terminal("single_line", true, {
						args = vim.v.count,
					})
				end,
				desc = "Send line to terminal",
			},
			{
				"<c-\\>",
				mode = "v",
				function()
					require("toggleterm").send_lines_to_terminal("visual_selection", true, {
						args = vim.v.count,
					})
				end,
				desc = "Send selection to terminal",
			},
		},
	},
}

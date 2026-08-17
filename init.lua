-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
local options = {
	tabstop = 2,
	smartindent = true,
	shiftwidth = 2,
	expandtab = true,
	number = true,
	termguicolors = true,
	clipboard = "unnamedplus",
	foldmethod = "expr",
	foldexpr = "v:lua.vim.treesitter.foldexpr()",
	foldcolumn = "0",
	foldtext = "",
	foldlevel = 99,
	foldlevelstart = 99,
	foldnestmax = 4,
	guifont = "Berkeley Mono Variable",
	autoindent = true,
	-- search
	hlsearch = false,
	ignorecase = true,
	smartcase = true,

	-- files
	undofile = true,
	autoread = true,
	undodir = vim.fn.expand("~/.vim/undodir"),

	-- split
	splitbelow = true,
	splitright = true,

	-- floats
	winborder = "rounded",
}

for option, value in pairs(options) do
	vim.opt[option] = value
end

local globals = {
	mapleader = " ",
	maplocalleader = "\\",
}

for opt, value in pairs(globals) do
	vim.g[opt] = value
end

vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
	pattern = "*",
	desc = "Restore terminal cursor",
	callback = function()
		vim.opt.guicursor = ""
		vim.fn.chansend(vim.v.stderr, "\x1b[6 q")
	end,
})

require("config.lazy")

vim.o.background = vim.env.NVIM_BACKGROUND or "dark"
vim.cmd.colorscheme("base16-mountain")

require("polish")
require("ui")

-- Pack
vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", require("undotree").open)

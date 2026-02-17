-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
local mappings = require("mappings")

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
}

for option, value in pairs(options) do
	vim.opt[option] = value
end

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")
require("polish")

vim.cmd.colorscheme("nyx")

if vim.lsp.inlay_hint then
	-- Enable inlay hints by default
	vim.lsp.inlay_hint.enable()
end

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local options = {
  tabstop = 2,
  smartindent = true,
  shiftwidth = 2,
  expandtab = true,
  number = true,
  termguicolors = true,
  clipboard = 'unnamedplus',
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

-- vim.cmd.syntax "off"

require("config.lazy")
require("polish")

vim.cmd.colorscheme "tokyonight"

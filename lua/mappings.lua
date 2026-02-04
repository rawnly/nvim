local M = {}

--- Add mappings to which-key
---@module "which-key"
---@param mappings wk.Spec
---@param opts? wk.Parse
function M.register(mappings, opts)
	local ok, which_key = pcall(require, "which-key")
	if ok then
		which_key.add(mappings, opts)
	end
end

function M.init()
	vim.g.mapleader = " "
	vim.g.maplocalleader = "\\"
end

return M

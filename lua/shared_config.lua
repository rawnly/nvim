local M = {}

M.colorschemes = {
	dark = "thorn",
	light = "cyberdream",
}

M.colorscheme = function()
	local bg = vim.env.NVIM_BACKGROUND

	if bg == nil then
		local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")

		if handle then
			local out = handle:read("*a") or ""
			handle:close()
			bg = out:match("Dark") and "dark" or "light"
		else
			bg = "dark"
		end
	end

	vim.o.background = bg
	return bg == "dark" and M.colorschemes.dark or M.colorschemes.light
end

return M

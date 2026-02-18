vim.filetype.add({
  pattern = {
    [".*/Caddyfile*"] = "caddy",
    [".*/.graphqlrc"] = "json",
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local lsp_keys = require("mappings.lsp")
    local mappings = require("mappings")

    mappings.setup(lsp_keys, args.buf)
  end,
})

vim.api.nvim_create_user_command("OpenPullRequest", function()
  local toggleterm = require('toggleterm')
  toggleterm.exec_command("gh targetprocess -c", 1)
end, { count = 1 })

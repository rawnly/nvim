return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "gopls",
        "rust_analyzer",
        "zls",
        "biome"
      },
      handlers = {
        function(server_name)
          if server_name == "tsserver" or server_name == "ts_ls" then
            return
          end
        end
      }
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  }
}

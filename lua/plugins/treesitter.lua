---@module "lazy.nvim"
---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy   = false,
    build  = ':TSUpdate',
    opts   = {
      sync_install = true,
      auto_install = true,
      ensure_installed = {
        "lua",
        "vim",
        "rust",
        "go",
        "astro",
        "bash",
        "fish",
        "fish",
        "zig",
        "css",
        "html",
        "markdown",
        "typescript",
        "javascript",
      },
    },
    config = function(_, opts)
      -- vim.cmd.syntax "off"
      vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = "*",
        callback = function()
          vim.treesitter.start()
        end
      })

      require("nvim-treesitter.install").prefer_git = true
    end
  }
}

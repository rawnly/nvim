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
        "tsx",
        "caddy",
        "nginx",
        "yaml",
        "toml",
        "css",
        "html",
        "markdown",
        "markdown_inline",
        "typescript",
        "javascript",
      },
    },
    config = function(_, opts)
      -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      -- vim.wo.foldmethod = 'expr'
      -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      -- vim.cmd.syntax "off"
      vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = "*",
        callback = function()
          vim.treesitter.start()
        end
      })

      require("nvim-treesitter.install").prefer_git = true

      return opts
    end
  }
}

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
      highlight = { enable = true },
      ensure_installed = {
        "lua",
        "vim",
        "rust",
        "go",
        "astro",
        "bash",
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
      require("nvim-treesitter.install").prefer_git = true
      require("nvim-treesitter.configs").setup(opts)
    end
  }
}

---@module "lazy.nvim"
---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    opts = {
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
      },
    },
  }
}

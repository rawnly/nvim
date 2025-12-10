---@module "lazy.nvim"
---@type LazySpec
return {
  "nvim-tree/nvim-web-devicons",
  {
    "folke/lazydev.nvim",
    opts = {
      library = {
        { path = "snacks.nvim",           words = { "Snacks" } },
        { path = "lazy.nvim",             words = { "LazyVim", "LazySpec" } },
        { path = "typescript-tools.nvim", words = { "Settings" } }

      }
    }
  },
  {
    "mvllow/modes.nvim",
    tag = "v0.2.1",
  },
  {
    "gelguy/wilder.nvim",
    lazy = false,
    opts = {
      modes = { ":", "?", "/" },
    }
  },
  {
    "max397574/better-escape.nvim",
    opts = {}
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    keys = function(ufo)
      return {
        { "zR", ufo.openAllFolds },
        { "zM", ufo.closeAllFolds }
      }
    end
  }
}

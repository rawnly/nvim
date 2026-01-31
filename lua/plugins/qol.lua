---@module "lazy.nvim"
---@type LazySpec
return {
  "nvim-tree/nvim-web-devicons",
  {
    "folke/lazydev.nvim",
    ft = "lua",
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
    opts = {}
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
    opts = {
      provider_selector = function()
        return { 'treesitter', 'indent' }
      end
    },
    keys = {
      { "zR", function() require("ufo").openAllFolds() end,  desc = "open all folds" },
      { "zM", function() require("ufo").closeAllFolds() end, desc = "close all folds" },
    }

  }
}

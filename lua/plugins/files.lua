---@module "lazy.nvim"
---@type LazySpec
return {
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    dependencies = {
      {
        "junegunn/fzf",
        opts = {
          extra_opts = { "--bind", "ctrl-f:preview-half-page-down,ctrl-b:preview-half-page-up" },
        },
      },
    },
  },
  {
    "stevearc/quicker.nvim",
    ft = "qf",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {},
  },
  {
    "stevearc/oil.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    lazy = false,
    keys = {
      {
        "<leader>e",
        ":Oil<CR>",
      },
    },
  },
}

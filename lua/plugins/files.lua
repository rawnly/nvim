---@module "lazy.nvim"
---@type LazySpec
return {
  {
    'stevearc/quicker.nvim',
    ft = "qf",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {},
  },
  {
    "dmtrKovalenko/fff.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = function()
      require("fff.download").download_or_build_binary()
    end,
    opts = {
      prompt = "> ",
      icons = { enabled = false },
      layout = {
        prompt_position = "top",
        width = 0.9,
        height = 0.9,
      },
      debug = {
        enabled = false,
        show_scores = false,
      },
      keymaps = {
        move_up = { "<C-k>", "<Up>", "<C-p>" },
        move_down = { "<C-j>", "<Down>", "<C-n>" },
      },
    },
    lazy = false,
    keys = {
      {
        "<leader>ff",
        function() require("fff").find_files() end,
        desc = "FFFind files",
      },
      {
        "ff",
        function() require("fff").find_files() end,
        desc = "FFFind files",
      },
    },
  },
  {
    'stevearc/oil.nvim',
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    lazy = false,
    keys = {
      {
        "<leader>e",
        ":Oil<CR>"
      }
    }
  }
}

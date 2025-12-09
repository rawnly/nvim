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
    build = function()
      require("fff.download").download_or_build_binary()
    end,
    -- enabled = false,
    opts = { -- (optional)
      prompt = "> ",
      icons = { enabled = false },
      layout = {
        prompt_position = "top",
        width = 0.9,
        height = 0.9,
      },
      debug = {
        enabled = false,     -- we expect your collaboration at least during the beta
        show_scores = false, -- to help us optimize the scoring system, feel free to share your scores!
      },
      keymaps = {
        move_up = { "<C-k>", "<Up>", "<C-p>" },
        move_down = { "<C-j>", "<Down>", "<C-n>" },
      },
    },
    lazy = false,
    keys = {
      {
        "<leader>ff", -- try it if you didn't it is a banger keybinding for a picker
        function() require("fff").find_files() end,
        desc = "FFFind files",
      },
      {
        "ff", -- try it if you didn't it is a banger keybinding for a picker
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
  }
}

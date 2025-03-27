return {
  {
    "echasnovski/mini.starter",
    enabled = true,
    opts = function(_, opts)
      return require("astrocore").extend_tbl(opts, {
        silent = true,
        items = {
          require("mini.starter").sections.builtin_actions(),
          require("mini.starter").sections.recent_files(5, true),
          require("mini.starter").sections.recent_files(5, false),
        },
      })
    end,
  },
  "overleaf/vim-env-syntax",
  "rawnly/gist.nvim",
  "DNLHC/glance.nvim",
  { "gelguy/wilder.nvim", lazy = false, opts = {
    modes = { ":", "?", "/" },
  } },
  {
    "shortcuts/no-neck-pain.nvim",
    opts = {
      width = 235,
    },
  },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
  {
    "johmsalas/text-case.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("textcase").setup {}
      require("telescope").load_extension "textcase"
    end,
    keys = {
      "ga", -- Default invocation prefix
      { "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Telescope" },
    },
    cmd = {
      -- NOTE: The Subs command name can be customized via the option "substitude_command_name"
      "Subs",
      "TextCaseOpenTelescope",
      "TextCaseOpenTelescopeQuickChange",
      "TextCaseOpenTelescopeLSPChange",
      "TextCaseStartReplacingCommand",
    },
    -- If you want to use the interactive feature of the `Subs` command right away, text-case.nvim
    -- has to be loaded on startup. Otherwise, the interactive feature of the `Subs` will only be
    -- available after the first executing of it or after a keymap of text-case.nvim has been used.
    lazy = false,
  },
}

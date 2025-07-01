return {
  {
    "sphamba/smear-cursor.nvim",
    opts = {
      smear_insert_mode = false,

      stiffness = 0.5,
      trailing_stiffness = 0.5,
      damping = 0.67,
      matrix_pixel_threshold = 0.5,

      -- stiffness = 0.8, -- 0.6      [0, 1]
      -- trailing_stiffness = 0.5, -- 0.4      [0, 1]
      -- stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
      -- trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
      -- damping = 0.8, -- 0.65     [0, 1]
      -- distance_stop_animating = 0.5, -- 0.1      > 0
    },
  },
  { "yioneko/nvim-vtsls" },
  "b0o/schemastore.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp_signature").setup() end,
  -- },
  { "rafcamlet/nvim-luapad" },
  "NoahTheDuke/vim-just", -- justfile support
  {
    "echasnovski/mini.starter",
    enabled = true,
    opts = function(_, opts)
      return require("astrocore").extend_tbl(opts, {
        silent = true,
        items = {
          require("mini.starter").sections.builtin_actions(),
          require("mini.starter").sections.recent_files(5, true),
          require("mini.starter").sections.recent_files(5, false, false),
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

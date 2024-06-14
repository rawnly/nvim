return {
  "ericpruitt/tmux.vim",
  "rawnly/gist.nvim",
  "DNLHC/glance.nvim",
  "shortcuts/no-neck-pain.nvim",
  {
    "kelly-lin/ranger.nvim",
    config = function()
      require("ranger-nvim").setup { replace_netrw = true }
      -- vim.api.nvim_set_keymap("n", "<leader>ef", "", {
      --   noremap = true,
      --   callback = function() require("ranger-nvim").open(true) end,
      -- })
    end,
  },
  {
    "m4xshen/hardtime.nvim",
    opts = {
      restricted_keys = {
        ["j"] = {},
        ["k"] = {},
        ["<cr>"] = {},
      },
    },
  },
}

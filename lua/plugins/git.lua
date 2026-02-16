---@type LazySpec
return {
  {
    "rawnly/targetprocess.nvim",
    dev = true,
    opts = {
      base_url = vim.env.TARGET_PROCESS_API_BASE_URL,
      token = vim.env.TARGET_PROCESS_ACCESS_TOKEN
    },
    keys = {
      {
        "<leader>tv",
        "<CMD>TargetProcessView<CR>",
        desc = "View",
      },
      {
        "<leader>to",
        "<CMD>TargetProcessOpen<CR>",
        desc = "Open",
      }
    }
  },
  { 'akinsho/git-conflict.nvim', version = "*", config = true },
  {
    "rawnly/gist.nvim",
    opts = {
      platform = "termbin",
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
    lazy = false,
    keys = function()
      local gitsigns = require("gitsigns")

      return {
        -- hunk
        {
          "<leader>hs",
          gitsigns.stage_hunk,
          desc = "Stage Hunk",
        },
        {
          "<leader>hr",
          gitsigns.reset_hunk,
          desc = "Reset Hunk",
        },
        {
          mode = "v",
          "<leader>hs",
          function()
            gitsigns.stage_hunk({
              vim.fn.line("."),
              vim.fn.line("v"),
            })
          end,
          desc = "Stage Hunk",
        },
        {
          mode = "v",
          "<leader>hr",
          function()
            gitsigns.reset_hunk({
              vim.fn.line("."),
              vim.fn.line("v"),
            })
          end,
          desc = "Reset Hunk",
        },
        {
          "<leader>hp",
          gitsigns.preview_hunk_inline,
          desc = "Preview hunk",
        },
        {
          "<leader>hS",
          gitsigns.stage_buffer,
          desc = "Stage Buffer",
        },
        {
          "<leader>hR",
          gitsigns.reset_buffer,
          desc = "Reset Buffer",
        },
        {
          "<leader>gb",
          gitsigns.blame_line,
          desc = "Blame Like",
        },
        {
          "<leader>gB",
          gitsigns.blame,
          desc = "Blame",
        },
      }
    end,
  },
  {
    "folke/which-key.nvim",
    keys = {
      {
        "<leader>fb",
        function()
          Snacks.picker.git_branches()
        end,
        desc = "Pick branch",
      },
      {
        "<leader>go",
        function()
          Snacks.gitbrowse.open({ what = "permalink", notify = false })
        end,
        desc = "View on github",
      },
      {
        "<leader>gc",
        function()
          Snacks.gitbrowse.open({
            what = "permalink",
            notify = true,
            open = function(url)
              vim.fn.setreg("+", url)
            end,
          })
        end,
        desc = "Copy git permalink",
      },
    },
  },
}

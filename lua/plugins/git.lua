---@type LazySpec
return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim"
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
    lazy = false,
    keys = function()
      local gitsigns = require('gitsigns')

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
          desc = "Reset Hunk"
        },
        {
          mode = "v",
          "<leader>hs",
          function()
            gitsigns.stage_hunk({
              vim.fn.line('.'),
              vim.fn.line('v')
            })
          end,
          desc = "Stage Hunk"
        },
        {
          mode = "v",
          "<leader>hr",
          function()
            gitsigns.reset_hunk({
              vim.fn.line('.'),
              vim.fn.line('v')
            })
          end,
          desc = "Reset Hunk"
        },
        {
          "<leader>hS",
          gitsigns.stage_buffer,
          desc = "Stage Buffer"
        },
        {
          "<leader>hR",
          gitsigns.reset_buffer,
          desc = "Reset Buffer"
        },
        {
          "<leader>hb",
          gitsigns.blame_line,
          desc = "Blame Like"
        },
        {
          "<leader>hB",
          gitsigns.blame,
          desc = "Blame"
        },
      }
    end
  },
  {
    "folke/which-key.nvim",
    keys = {
      {
        "<leader>gb",
        function() Snacks.picker.git_branches() end,
        desc = "Pick branch"
      },
      {
        "<leader>go",
        function() Snacks.gitbrowse.open() end,
        desc = "View on github"
      },
    }
  }
}

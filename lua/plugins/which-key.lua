return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    ---@class wk.Opts
    opts = {
      preset = "helix",
      delay = 0,
      spec = {
        { "<leader>w", proxy = "<c-w>",           group = "windows" },
        { "<leader>l", group = "LSP" },
        { "<leader>f", group = "File" },
        { "<leader>h", group = "Hunk" },
        { "<leader>g", group = "Git" },
        { "<leader>x", group = "Trouble" },
        { "<leader>s", group = "Search & Replace" },
        { "<leader>b", group = "Buffers" },
        { "<leader>t", group = "TargetProcess" },
      },
      plugins = {
        presets = {
          motions = true,
          nav = true,
          operators = true,
          windows = true,
          text_objects = true
        }
      }
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
      { "<C-q>", "<CMD>q!<CR><ESC>" },
      { "<C-s>", "<cmd>w!<cr><esc>", desc = "Save File", mode = { "i", "x", "n", "s" }, },
      {
        "<cr>",
        function()
          if vim.bo.modifiable then
            return "ciw"
          else
            return "<cr>"
          end
        end,
        desc = "Clear cursor word",
        mode = "n",
        expr = true,
      },
    },
  }
}

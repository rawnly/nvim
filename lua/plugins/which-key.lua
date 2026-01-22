return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    ---@class wk.Opts
    opts = {
      preset = "helix",
      delay = 0,
      spec = {
        { "<leader>l", group = "LSP" },
        { "<leader>f", group = "File" },
        { "<leader>h", group = "Hunk" },
        { "<leader>g", group = "Git" },
        { "<leader>x", group = "Trouble" },
        { "<leader>s", group = "Search & Replace" },
        { "<leader>b", group = "Buffers" },
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
      { "<CR>",  "ciw", cond = function() return vim.bo.modifiable end },
      { "<C-q>", "<CMD>q!<CR><ESC>" },
      { "<C-s>", "<cmd>w!<cr><esc>", desc = "Save File", mode = { "i", "x", "n", "s" }, },
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
      { "<leader>lr", vim.lsp.buf.rename,      desc = "Rename" },
      { "<leader>la", vim.lsp.buf.code_action, desc = "Code Actions" },
    },
  }
}

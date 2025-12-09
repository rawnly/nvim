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
        { "<leader>h", group = "Git" },
        { "<leader>x", group = "Trouble", desc = "Trouble" },
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
      { "<CR>",  "ciw" },
      { "<C-q>", "<CMD>q<CR>" },
      { "<C-s>", "<CMD>w<CR>" },
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

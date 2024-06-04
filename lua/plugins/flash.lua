return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    ---@type Flash.Config
    opts = {
      label = {
        rainbow = {
          enabled = true,
        },
      },
      modes = {
        char = {
          enabled = false,
          jump_labels = true,
          autohide = true,
        },
        search = {
          enabled = true,
          mode = "fuzzy",
        },
      },
    },
    keys = {
      -- {
      --   "<Tab>",
      --   desc = "Select any word",
      --   mode = { "n" },
      --   function()
      --     require("flash").jump {
      --       pattern = ".",
      --       search = {
      --         mode = function(pattern)
      --           if pattern:sub(1, 1) == "." then pattern = pattern:sub(2) end
      --           return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
      --         end,
      --       },
      --     }
      --   end,
      -- },
      -- {
      --   "s",
      --   desc = "Flash",
      --   mode = { "n", "x", "o" },
      --   function()
      --     require("flash").jump {
      --       continue = true,
      --       search = {
      --         incremental = false,
      --         -- mode = function(str) return "\\<" .. str end,
      --       },
      --     }
      --   end,
      -- },
      {
        "S",
        desc = "Flash Treesitter",
        mode = { "n", "o", "x" },
        function() require("flash").treesitter() end,
      },
    },
  },
}

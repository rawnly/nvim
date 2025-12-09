---@module "lazy.nvim"
---@type LazySpec

local utils = require("utils")

return {
  "b0o/schemastore.nvim",
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = false },
      explorer = { enabled = false },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      scratch = {
        win_by_ft = {
          go = {
            keys = {
              ["source"] = {
                "<cr>",
                function(self)
                  local filename = string.format("%s.go", os.tmpname())
                  local content = table.concat(utils.read_buffer(self.buf), "\n")

                  local file = io.open(filename, "w+")
                  file:write(content)
                  file:close()

                  local out = utils.exec(string.format("go run %s", filename))

                  Snacks.notifier.notify(out)
                end,
                desc = "Source buffer",
                mode = { "n", "x" }
              }
            }
          },
          javascript = {
            keys = {
              ["source"] = {
                "<cr>",
                function(self)
                  local filename = string.format("%s.js", os.tmpname())
                  local content = table.concat(utils.read_buffer(self.buf), "\n")

                  local file = io.open(filename, "w+")
                  file:write(content)
                  file:close()

                  local out = utils.exec(string.format("node %s", filename))

                  Snacks.notifier.notify(out)
                end,
                desc = "Source buffer",
                mode = { "n", "x" }
              }
            }
          },
          typescript = {
            keys = {
              ["source"] = {
                "<cr>",
                function(self)
                  local filename = string.format("%s.ts", os.tmpname())
                  local content = table.concat(utils.read_buffer(self.buf), "\n")

                  local file = io.open(filename, "w+")
                  file:write(content)
                  file:close()

                  local out = utils.exec(string.format("node %s", filename))

                  Snacks.notifier.notify(out)
                end,
                desc = "Source buffer",
                mode = { "n", "x" }
              }
            }
          },
          lua = {
            keys = {
              ["source"] = {
                "<cr>",
                function(self)
                  local name = "scratch." .. vim.fn.fnamemodify(vim.api.nvim_buf_get_name(self.buf), ":e")
                  Snacks.debug.run({ buf = self.buf, name = name })
                end,
                desc = "Source buffer",
                mode = { "n", "x" },
              },
            },
          },
        },

      }
    },
    keys = {
      { "<leader>fw", function() Snacks.picker.grep() end,      desc = "Search Grep" },
      { "<leader>fc", function() Snacks.picker.grep_word() end, desc = "Search current word" },
      { "<leader>fr", function() Snacks.picker.recent() end,    desc = "Recent" },
      { "<leader>.",  function() Snacks.scratch() end,          desc = "Scratch" },
      { "<c-->",      function() Snacks.terminal() end,         desc = "Toggle Terminal" },
    }
  }
}

local utils = require("utils")

---@param bufnr integer
---@param extension string
function get_tmp_file(bufnr, extension)
  local filename = string.format("%s.%s", os.tmpname(), extension)
  local content = table.concat(utils.read_buffer(bufnr), "\n")

  local file = io.open(filename, "w+")

  if file == nil then
    return
  end

  file:write(content)
  file:close()

  return filename
end

---@param bufnr integer
---@param extension string
---@param cmd string
function execute_buffer(bufnr, extension, cmd)
  local filename = get_tmp_file(bufnr, extension)
  if not filename then
    return
  end

  local out = utils.exec(string.format("%s %s", cmd, filename))
  if not out then
    return
  end

  Snacks.notifier.notify(out, 'debug')
  os.remove(filename)
end

---@module "lazy.nvim"
---@type LazySpec
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- Your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    zen = { enabled = true },
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
              function(self) execute_buffer(self.buf, "go", "go run") end,
              desc = "Source buffer",
              mode = { "n", "x" }
            }
          }
        },
        javascript = {
          keys = {
            ["source"] = {
              "<cr>",
              function(self) execute_buffer(self.buf, "js", "node") end,
              desc = "Source buffer",
              mode = { "n", "x" }
            }
          }
        },
        typescript = {
          keys = {
            ["source"] = {
              "<cr>",
              function(self) execute_buffer(self.buf, "ts", "bun") end,
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
    { "<C-'>",      function() Snacks.terminal() end,         desc = "Toggle Terminal" },
  }
}

---@type Terminal
local lazygit

---@type Terminal
local devserver

local function get_lazygit()
  if not lazygit then
    local Terminal = require('toggleterm.terminal').Terminal
    lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = 'float',
      dir = "git_dir",
      float_opts = {
        border = "double"
      },
      on_open = function(t)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(t.bufnr, 'n', 'q', '<cmd>close<cr>', {
          noremap = true,
          silent = true
        })
      end,
    })
  end

  return lazygit
end

local function get_dev_server()
  if not devserver then
    local Terminal = require('toggleterm.terminal').Terminal
    devserver = Terminal:new({
      cmd = "pnpm dev",
      hidden = true,
      close_on_exit = true,
      auto_scroll = true,
      direction = 'float',
    })
  end

  return devserver
end


---@type LazySpec
return {
  {
    "akinsho/toggleterm.nvim",
    version = '*',
    opts = {
      open_mapping = [[<c-'>]],
      autochdir = true,
      direction = 'horizontal',
      size = function(t)
        if t.direction == "horizontal" then
          return 20
        elseif t.direction == "vertical" then
          return vim.o.columns * 0.3
        end
      end
    },
    keys = {
      {
        "<leader>gt",
        function()
          get_lazygit():toggle()
        end,
        desc = "Lazygit"
      },
      {
        "<leader>rd",
        function()
          get_dev_server():toggle()
        end,
        desc = "Toggle dev server"
      }
    }
  }
}

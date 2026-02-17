---@type Terminal
local lazygit

---@type Terminal
local devserver

local function close_on_q(bufnr)
  vim.cmd("startinsert!")
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'q', '<cmd>close<cr>', {
    noremap = true,
    silent = true
  })
end

local function get_lazygit()
  if not lazygit then
    local Terminal = require('toggleterm.terminal').Terminal
    lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = 'float',
      dir = "git_dir",
      display_name = "Lazygit",
      float_opts = {
        border = "double"
      },
      on_open = function(t)
        close_on_q(t.bufnr)
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
      float_opts = {
        border = "double",

      },
      on_open = function(t)
        close_on_q(t.bufnr)
      end,
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
        "<leader>rl",
        function()
          get_lazygit():toggle()
        end,
        desc = "lazygit"
      },
      {
        "<leader>rd",
        function()
          get_dev_server():toggle()
        end,
        desc = "pnpm dev"
      }
    }
  }
}

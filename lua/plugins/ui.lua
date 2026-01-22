---@type LazySpec
return {
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    dependencies = {
      {
        'junegunn/fzf',
        opts = {
          extra_opts = { '--bind', 'ctrl-f:preview-half-page-down,ctrl-b:preview-half-page-up' }
        }
      }
    }
  },
  {
    "serhez/bento.nvim",
    enabled = false,
    opts = {
      ui = {
        mode = "floating",
        floating = {
          minimal_menu = 'full'
        }
      }
    }
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    event = "VeryLazy",
    enabled = true,
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        close_command = function(n) Snacks.bufdelete(n) end,
        right_mouse_command = function(n) Snacks.bufdelete(n) end,
        always_show_bufferline = false,
      }
    },
    keys = {
      { "<S-h>",      "<CMD>BufferLineCyclePrev<CR>",    desc = "Prev Buffer" },
      { "<S-l>",      "<CMD>BufferLineCycleNext<CR>",    desc = "Next Buffer" },
      { "<leader>c",  function() Snacks.bufdelete() end, desc = "Delete Buffer" },
      { "<leader>bp", "<CMD>BufferLineTogglePin<CR>",    desc = "Pin Buffer" },
      { "<leader>bc", "<CMD>BufferLineCloseOthers<CR>",  desc = "Delete Other Buffers" }
    }
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      cmdline = {
        view = 'cmdline'
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
      },
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,        -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        options = {
          theme = "auto",
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = {
            statusline = {
              "dashboard"
            }
          }
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },

          lualine_c = {
            "diagnostics",
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } }
          },

          lualine_x = {
            Snacks.profiler.status(),
            {
              "diff",
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },

          lualine_y = {
            { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },

          lualine_z = {
            function()
              return " " .. os.date("%R")
            end,
          },
        }
      }
    end
  }
}

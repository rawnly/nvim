return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "User AstroFile",
    enabled = true,
    opts = {
      panel = {
        enabled = true,
        layout = {
          position = "right",
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = false,
          accept_word = false,
          accept_line = false,
        },
      },
    },
    specs = {
      {
        "AstroNvim/astrocore",
        opts = {
          options = {
            g = {
              -- set the ai_accept function
              ai_accept = function()
                if require("copilot.suggestion").is_visible() then
                  require("copilot.suggestion").accept()
                  return true
                end
              end,
            },
          },
        },
      },
    },
  },
  -- TODO: Investigate why it's not suggesting anything
  {
    "Exafunction/codeium.nvim",
    enabled = false,
    cmd = "Codeium",
    event = "InsertEnter",
    build = ":Codeium Auth",
    opts = {
      virtual_text = {
        key_bindings = {
          accept = false, -- handled by completion engine
        },
      },
    },
    specs = {
      {
        "AstroNvim/astrocore",
        opts = {
          options = {
            g = {
              -- set the ai_accept function
              ai_accept = function()
                if require("codeium.virtual_text").get_current_completion_item() then
                  vim.api.nvim_input(require("codeium.virtual_text").accept())
                  return true
                end
              end,
            },
          },
        },
      },
    },
  },
}

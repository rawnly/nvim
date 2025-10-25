return {
  "MeanderingProgrammer/render-markdown.nvim",
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "User AstroFile",
    enabled = true,
    opts = {
      panel = {
        enabled = false,
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
  --@type LazySpec
  {
    "folke/sidekick.nvim",
    lazy = false,
    opts = {
      cli = {
        nes = { enabled = false },
        mux = {
          backend = "zellij",
          enabled = true,
        },
      },
    },
    specs = {
      -- TODO: Currently, I'm manually starting the copilot lsp with LspStart and then LspCopilotSignIn
      -- If you use copilot.lua this is handled for you.
      {
        "williamboman/mason-lspconfig.nvim",
        optional = true,
        opts = function(_, opts)
          opts.ensure_installed =
            require("astrocore").list_insert_unique(opts.ensure_installed, { "copilot-language-server" })
        end,
      },
      {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        optional = true,
        opts = function(_, opts)
          opts.ensure_installed =
            require("astrocore").list_insert_unique(opts.ensure_installed, { "copilot-language-server" })
        end,
      },
      {
        "AstroNvim/astrocore",
        ---@param opts AstroCoreOpts
        opts = function(_, opts)
          local maps = assert(opts.mappings)
          local prefix = "<Leader>A"
          local cli_tool = vim.g.sidekick_cli_tool or "claude"
          maps.n[prefix] = { desc = require("astroui").get_icon("Sidekick", 1, true) .. "Sidekick" }
          maps.x[prefix] = { desc = require("astroui").get_icon("Sidekick", 1, true) .. "Sidekick" }

          maps.n[prefix .. "a"] = {
            function() require("sidekick.cli").toggle { name = cli_tool } end,
            desc = "Sidekick Toggle CLI",
          }
          maps.n[prefix .. "s"] = {
            function() require("sidekick.cli").select { name = cli_tool } end,
            -- Or to select only installed tools:
            -- require("sidekick.cli").select({ filter = { installed = true } })
            desc = "Select CLI",
          }
          for _, mode in ipairs { "n", "x" } do
            maps[mode][prefix .. "t"] = {
              function() require("sidekick.cli").send { name = cli_tool, msg = "{this}" } end,
              desc = "Send This",
            }
          end
          maps.x[prefix .. "v"] = {
            function() require("sidekick.cli").send { name = cli_tool, msg = "{selection}" } end,
            desc = "Send Visual Selection",
          }
          for _, mode in ipairs { "n", "x" } do
            maps[mode][prefix .. "p"] = {
              function() require("sidekick.cli").prompt { name = cli_tool } end,
              desc = "Sidekick Select Prompt",
            }
          end
          for _, mode in ipairs { "n", "x", "i", "t" } do
            maps[mode]["<c-.>"] = {
              function() require("sidekick.cli").focus() end,
              desc = "Sidekick Switch Focus",
            }
          end
        end,
      },
      { "AstroNvim/astroui", opts = { icons = { Sidekick = "" } } },
    },
    -- TODO: see how we want to handle tabs, I think we'll need to do something so it works with existing tab to do inline completions
    keys = {
      {
        "<tab>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>" -- fallback to normal tab
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
    },
  },
}
--   -- TODO: Investigate why it's not suggesting anything
--   {
--     "Exafunction/codeium.nvim",
--     enabled = false,
--     cmd = "Codeium",
--     event = "InsertEnter",
--     build = ":Codeium Auth",
--     opts = {
--       virtual_text = {
--         key_bindings = {
--           accept = false, -- handled by completion engine
--         },
--       },
--     },
--     specs = {
--       {
--         "AstroNvim/astrocore",
--         opts = {
--           options = {
--             g = {
--               -- set the ai_accept function
--               ai_accept = function()
--                 if require("codeium.virtual_text").get_current_completion_item() then
--                   vim.api.nvim_input(require("codeium.virtual_text").accept())
--                   return true
--                 end
--               end,
--             },
--           },
--         },
--       },
--     },
--   },
-- }

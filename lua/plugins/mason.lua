return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        ["dockerfile"] = { "hadolint" },
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "gopls",
        "zls",
        "biome",
        "jsonls",
        "yamlls",
        -- "docker-langauge-server",
        "docker_compose_language_service",
        -- "hadolint",
        "ruff",
        "pyright"
      },
      handlers = {
        function(server_name)
          if server_name == "tsserver" or server_name == "ts_ls" then
            return
          end
          require("lspconfig")[server_name].setup({})
        end,
        jsonls = function()
          require('lspconfig').jsonls.setup {
            settings = {
              json = {
                schemas = require('schemastore').json.schemas {
                  extra = {
                    {
                      description = "ecs task definition",
                      fileMatch = "task-*.json",
                      name = "ecs-task-definition",
                      url = "https://ecs-intellisense.s3-us-west-2.amazonaws.com/task-definition/schema.json"
                    }
                  }
                },
                validate = { enable = true },
              },
              yaml = {
                schemaStore = {
                  enable = true,
                  url = ""
                },
                schemas = require('schemastore').yaml.schemas()
              },
            },
          }
        end
      }
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
      "b0o/schemastore.nvim",
    },
  }
}

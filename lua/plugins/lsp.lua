---@module "lazy.nvim"
---@type LazySpec
return {
  {
    "folke/trouble.nvim",
    -- for default options, refer to the configuration section for custom setup.
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>xl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    'DNLHC/glance.nvim',
    cmd = 'Glance',
    keys = {
      { "gr", "<CMD>Glance references<CR>",  desc = "Go to references" },
      { "gd", "<CMD>Glance definitions<CR>", desc = "Go to definitions" }
    }
  },
  {
    'stevearc/conform.nvim',
    opts = {
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        return {
          timeout_ms = 500,
          lsp_format = "fallback"
        }
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "biome", "biome-organize-imports" },
        javascriptreact = { "biome", "biome-organize-imports" },
        typescript = { "biome", "biome-organize-imports" },
        typescriptreact = { "biome", "biome-organize-imports" },
        go = { "goimports", "gofmt" },
        rust = { "rustfmt" }
      }
    },
  },
  {
    'stevearc/aerial.nvim',
    keys = {
      {
        "<leader>lS",
        ":AerialOpen left<CR>",
        desc = "Show Outline"
      }
    },
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    opts = {}
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ---@module "typescript-tools.nvim"
      ---@class Settings
      settings = {
        tsserver_file_preferences = {
          includeInlayParameterNameHints = 'all',
        },
      }
    },
  },
  {
    "folke/which-key.nvim",
    keys = {
      { "<leader>ld", vim.diagnostic.open_float, desc = "Hover Diagnostics" },
      { "<leader>li", ":LspInfo<CR><esc>",       desc = "Info" },
      {
        "<leader>lh",
        function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
        end,
        desc = "Info"
      },
    }
  }
}

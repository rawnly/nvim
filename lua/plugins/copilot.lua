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
          accept_word = false,
          accept_line = false,
        },
      },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function() require("copilot_cmp").setup() end,
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = { "zbirenbaum/copilot.lua", "zbirenbaum/copilot-cmp" },
  --   opts = function(_, opts)
  --     local cmp, supermaven = require "cmp", require "supermaven-nvim.completion_preview"
  --     local snip_status_ok, luasnip = pcall(require, "luasnip")
  --
  --     if not snip_status_ok then return end
  --
  --     local function has_words_before()
  --       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
  --     end
  --
  --     if not opts.mapping then opts.mapping = {} end
  --
  --     opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
  --       if supermaven.has_suggestion() then
  --         supermaven.on_accept_suggestion()
  --       elseif cmp.visible() then
  --         cmp.select_next_item()
  --       elseif luasnip.expand_or_jumpable() then
  --         luasnip.expand_or_jump()
  --       elseif has_words_before() then
  --         cmp.complete()
  --       else
  --         fallback()
  --       end
  --     end, { "i", "s" })
  --
  --     opts.sources = {
  --       -- { name = "copilot", group_index = 2 },
  --       { name = "supermaven", group_index = 2 },
  --       { name = "path", group_index = 2 },
  --       { name = "nvim_lsp", group_index = 2 },
  --       { name = "luasnip", group_index = 2 },
  --     }
  --
  --     return opts
  --   end,
  -- },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "zbirenbaum/copilot.lua", "zbirenbaum/copilot-cmp" },
    opts = function(_, opts)
      local cmp, copilot = require "cmp", require "copilot.suggestion"
      local snip_status_ok, luasnip = pcall(require, "luasnip")

      if not snip_status_ok then return end

      local function has_words_before()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end

      if not opts.mapping then opts.mapping = {} end

      opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
        if copilot.is_visible() then
          copilot.accept()
        elseif cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" })

      opts.mapping["<C-p>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.prev() end
      end)

      opts.mapping["<C-n>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.next() end
      end)

      opts.sources = {
        -- { name = "copilot", group_index = 2 },
        { name = "path", group_index = 2 },
        { name = "nvim_lsp", group_index = 2 },
        { name = "luasnip", group_index = 2 },
      }

      return opts
    end,
  },
}

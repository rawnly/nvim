-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        background = "dark",
      },
      g = { -- vim.g.<key>
        enfocado_style = "nature",
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        L = {
          function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Next buffer",
        },
        H = {
          function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          desc = "Previous buffer",
        },
        ["<Leader>o"] = {
          "<cmd>Neotree reveal<CR>",
        },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },

        ["<Leader>b"] = { desc = "Buffers" },
        ["<LocalLeader>b"] = { desc = "Buffers" },

        -- quick save
        ["<C-s>"] = { ":w!<cr>", desc = "Save File" },

        -- quick quit
        ["<C-q>"] = { ":q<cr>", desc = "Quit buffer" },

        ["<CR>"] = { "ciw" },
        ["<BS>"] = { "cw" },

        -- Use Glance
        ["gd"] = {
          ":Glance definitions<cr>",
          desc = "Glance definitions",
        },
        ["gr"] = {
          ":Glance references<CR>",
          desc = "Glance references",
        },
        ["gm"] = {
          ":Glance implementations<CR>",
          desc = "Glance implementations",
        },
        ["gy"] = {
          ":Glance type_definitions<CR>",
          desc = "Glance type_definitions",
        },

        ["<Leader>uN"] = {
          "<cmd>lua require('no-neck-pain').toggle()<CR>",
          desc = "Toggle No Neck Pain",
        },

        ["<Leader>fgc"] = {
          ":GitConflictListQf<CR>",
          desc = "Git Conflict List",
        },

        ["<Leader>ff"] = {
          function() require("fff").find_files() end,
          desc = "FFFind files",
        },
      },
    },
  },
}

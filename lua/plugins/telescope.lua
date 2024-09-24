return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "kkharji/sqlite.lua" },
    { "nvim-telescope/telescope-smart-history.nvim", requires = { "kkharji/sqlite.lua" } },
    "nvim-lua/popup.nvim",
    "jvgrootveld/telescope-zoxide",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  opts = function(_, opts)
    local actions = require "telescope.actions"
    local get_icon = require("astroui").get_icon

    local config = require "telescope.config"
    local vimgrep_arguments = {
      unpack(config.values.vimgrep_arguments),
    }

    table.insert(vimgrep_arguments, "--hidden")
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")

    local function formattedName(_, path)
      local tail = vim.fs.basename(path)
      local parent = vim.fs.dirname(path)
      if parent == "." then return tail end
      return string.format("%s\t\t%s", tail, parent)
    end

    local mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
      },
    }

    return require("astrocore").extend_tbl(opts, {
      pickers = {
        find_files = {
          previewer = false,
          path_display = formattedName,
          layout_config = {
            height = 0.4,
            prompt_position = "top",
            preview_cutoff = 120,
          },
          find_command = {
            "rg",
            "--files",
            "--color=never",
            "--smart-case",
            "--trim",
            "--hidden",
            "--glob",
            "!**/.git/*",
          },
        },
        git_files = {
          previewer = false,
          path_display = formattedName,
          layout_config = {
            height = 0.4,
            prompt_position = "top",
            preview_cutoff = 120,
          },
        },
        live_grep = {
          only_sort_text = true,
          previewer = true,
          file_ignore_patterns = {
            "*.lock",
            "package-lock.json",
            "yarn.lock",
            "pnpm-lock.yaml",
            "pnpm-lock.yml",
            "Cargo.lock",
            "*.lock",
          },
        },
      },
      defaults = {
        vimgrep_arguments,
        file_ignore_patterns = {
          "*/node_modules/*",
          "**/.git/*",
          "*/target/*",
          "*/dist/*",
          "*/build/*",
          "*/.next/*",
        },
        history = {
          path = "~/.local/share/nvim/databases/history.sqlite3",
          limit = 1000,
        },
        previewer = false,
        prompt_prefix = " " .. get_icon "Search" .. " ",
        mappings = mappings,
        layout_config = {
          prompt_position = "top",
        },
      },
      extensions = {
        -- frecency = {
        --   default_workspace = "CWD",
        --   show_scores = true,
        --   disable_devicons = false,
        --   ignore_patterns = {
        --     "*.git/*",
        --     "*/tmp/*",
        --     "*/lua-language-server/*",
        --     "*/node_modules/*",
        --     "*/target/*",
        --   },
        -- },
        zoxide = {
          prompt_title = "[ Walking on the moon ]",
        },
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })
  end,
  config = function(...)
    require "astronvim.plugins.configs.telescope"(...)

    local telescope = require "telescope"
    telescope.load_extension "zoxide"
    telescope.load_extension "fzf"
    telescope.load_extension "smart_history"
  end,
}

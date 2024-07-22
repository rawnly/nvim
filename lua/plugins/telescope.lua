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
    local get_icon = require("astroui").get_icon

    local config = require "telescope.config"
    local vimgrep_arguments = {
      unpack(config.values.vimgrep_arguments),
    }

    table.insert(vimgrep_arguments, "--hidden")
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")

    local function flash(prompt_bufnr)
      require("flash").jump {
        pattern = "^",
        label = { after = { 0, 0 } },
        search = {
          mode = "search",
          exclude = {
            function(win) return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults" end,
          },
        },
        action = function(match)
          local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
          picker:set_selection(match.pos[1] - 1)
        end,
      }
    end

    local function formattedName(_, path)
      local tail = vim.fs.basename(path)
      local parent = vim.fs.dirname(path)
      if parent == "." then return tail end
      return string.format("%s\t\t%s", tail, parent)
    end

    local actions = require "telescope.actions"

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
          previewer = false,
          file_ignore_patterns = {
            "*.lock",
            "package-lock.json",
            "yarn.lock",
            "pnpm-lock.yaml",
            "pnpm-lock.yml",
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
          path = "~/.local/share/nvim/databases/telescope.sqlite3",
          limit = 1000,
        },
        previewer = false,
        prompt_prefix = " " .. get_icon "Search" .. " ",
        layout_config = {
          prompt_position = "top",
        },
        mappings = {
          n = {
            s = flash,
          },
          i = {
            ["<c-s>"] = flash,
            ["<c-p>"] = actions.cycle_history_prev,
            ["<c-n>"] = actions.cycle_history_next,
          },
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
  end,
}

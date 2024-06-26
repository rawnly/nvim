return {
  "nyoom-engineering/oxocarbon.nvim",
  "RRethy/base16-nvim",
  { "typicode/bg.nvim", lazy = false },
  -- { "rose-pine/neovim", name = "rose-pine" },
  {
    "fynnfluegge/monet.nvim",
    name = "monet",
    opts = {
      transparent_background = true,
      dark_mode = true,
    },
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
      local c = require("kanagawa.colors").setup({ theme = "wave" }).palette

      local BG = c.dragonBlack3
      local ALMOST_BG = c.dragonBlack4
      local WHITE = "#9da2af"
      local GRAY = "#80838f"
      local FADED_GRAY = "#33373a"
      local STRONG_FADED_GRAY = "#2a2d30"

      return {
        compile = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        overrides = function()
          local overrides = {
            -- bufferline
            BufferLineFill = { bg = BG },
            BufferLineBackground = { bg = BG, fg = FADED_GRAY }, -- unactive tabs to faded gray
            BufferLineSeparator = { fg = BG },
            BufferLineModified = { fg = BG },
            BufferlineBufferSelected = { fg = GRAY }, -- active tabs to gray
            BufferlineBufferVisible = { fg = GRAY }, -- active tabs to gray
            BufferLineIndicatorVisible = { fg = BG },

            -- indentline
            IndentBlanklineChar = { fg = ALMOST_BG },

            -- GitSigns
            GitSignsAdd = { fg = c.oniViolet },
            GitSignsAddNr = { fg = c.oniViolet },
            GitSignsAddLn = { fg = c.oniViolet },
            GitSignsChange = { fg = c.oniViolet },
            GitSignsChangeNr = { fg = c.oniViolet },
            GitSignsChangeLn = { fg = c.oniViolet },
            GitSignsCurrentLineBlame = { fg = FADED_GRAY },

            -- NvimTree
            NvimTreeGitDirty = { fg = c.oniViolet },
            NvimTreeGitStaged = { fg = c.oniViolet },
            NvimTreeGitMerge = { fg = c.oniViolet },
            NvimTreeGitRenamed = { fg = c.oniViolet },
            NvimTreeGitNew = { fg = c.oniViolet },
            NvimTreeGitDeleted = { fg = c.oniViolet },
            NvimTreeFolderName = { fg = WHITE },
            NvimTreeOpenedFolderName = { fg = WHITE },
            NvimTreeEmptyFolderName = { fg = WHITE },
            NvimTreeRootFolder = { fg = GRAY },
            NvimTreeSpecialFile = { fg = WHITE, bold = true },
            NvimTreeNormalFloat = { bg = BG },
            NvimTreeCursorLine = { bg = ALMOST_BG },
            NvimTreeIndentMarker = { fg = STRONG_FADED_GRAY },
            NvimTreeImageFile = { fg = WHITE },
            NvimTreeFolderIcon = { fg = GRAY },
            NvimTreeFolderIconOpen = { fg = GRAY },
            NvimTreeFolderSymlink = { fg = GRAY },
            NvimTreeDefault = { fg = GRAY },
            NvimTreeSymlink = { fg = GRAY },
            NvimTreeBookmark = { fg = GRAY },
          }
          return overrides
        end,
      }
    end,
  },
}

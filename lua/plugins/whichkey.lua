return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    local core = require "astrocore"

    return core.extend_tbl(opts, {
      preset = "helix",
      delay = 0,
      plugins = {
        presets = {
          motions = true,
          nav = true,
          windows = true,
          operators = true,
          text_objects = true,
        },
      },
    })
  end,
}

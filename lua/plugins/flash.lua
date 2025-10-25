return {
  {
    "folke/flash.nvim",
    --@type Flash.Config
    opts = {
      label = {
        rainbow = {
          enabled = true,
        },
      },
      modes = {
        char = {
          enabled = true,
          jump_labels = true,
          autohide = true,
        },
        search = {
          enabled = true,
          mode = "fuzzy",
        },
      },
    },
  },
}

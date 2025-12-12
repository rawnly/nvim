return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      cache = true,
      saturation = 0.5
    }
  },
  {
    'folke/tokyonight.nvim',
    lazy = true,
    priority = 1000,
    opts = {
      style = 'night',
      transparent = true,
      styles = {
        keywords = {
          italic = true,
          bold = true
        }
      },
      dim_inactive = true
    }, -- Or 'day'/'moon'
  },
  {
    "folke/which-key.nvim",
    keys = {
      {
        "<leader>ft",
        function() Snacks.picker.colorschemes() end,
        desc = "Search Themes"
      },
    }
  }
}

return {
  -- {
  --   "scottmckendry/cyberdream.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent = true,
  --     cache = true,
  --     saturation = 0.5
  --   }
  -- },
  {
    'folke/tokyonight.nvim',
    lazy = true,
    priority = 1000,
    opts = { style = 'night' }, -- Or 'day'/'moon'
  },
}

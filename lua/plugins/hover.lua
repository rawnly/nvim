return {
  "lewis6991/hover.nvim",
  opts = {
    providers = {
      'hover.providers.diagnostic',
      'hover.providers.lsp',
      'hover.providers.dap',
      'hover.providers.man',
      'hover.providers.gh',
      'targetprocess.plugins.hover'
    }
  },
  keys = {
    {
      'K',
      function() require('hover').open() end,
      mode = 'n',
      desc = "hover.nvim (open)",
    },
    {
      'gK',
      function() require('hover').enter() end,
      mode = 'n',
      desc = "hover.nvim (enter)",
    }
  }
}

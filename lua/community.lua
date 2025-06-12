-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.recipes.ai" },
  -- import/override with your plugins folder
  { import = "astrocommunity.pack.fish" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.svelte" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.zig" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.json" },
  -- { import = "astrocommunity.pack.typescript" },
  --
  { import = "astrocommunity.motion.marks-nvim" },
  { import = "astrocommunity.motion.flit-nvim" },
  --
  { import = "astrocommunity.color.modes-nvim" },
  --
  { import = "astrocommunity.syntax.vim-sandwich" },
  { import = "astrocommunity.syntax.hlargs-nvim" },
  --
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.recipes.neo-tree-dark" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.quickfix.nvim-bqf" },
  { import = "astrocommunity.test.neotest" },
}

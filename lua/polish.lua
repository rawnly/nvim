local function enable_treesitter_highlight(treesitter_language, buffer_language)
  local buffer = vim.api.nvim_get_current_buf()

  return vim.schedule_wrap(function()
    -- NOTE: The tree-sitter parser language name is often the same as the
    -- Vim buffer filetype. So these are reasonable default values.
    --
    buffer_language = buffer_language or vim.bo[buffer].filetype
    treesitter_language = treesitter_language or buffer_language

    local parser = vim.treesitter.get_parser(buffer, treesitter_language)

    if not parser then
      vim.notify(
        string.format(
          'Buffer "%s" could not be parsed with "%s" tree-sitter parser.',
          buffer,
          treesitter_language
        ),
        vim.log.levels.ERROR
      )

      return
    end

    parser:parse(true, function()
      vim.treesitter.language.register(treesitter_language, buffer_language)
      vim.treesitter.highlighter.new(parser)
    end)
  end)
end

-- Autocmd to trigger Tree-sitter for Python files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = enable_treesitter_highlight("python")
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = enable_treesitter_highlight("go")
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "ts",
  callback = enable_treesitter_highlight("typescript")
})

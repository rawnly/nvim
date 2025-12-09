local M = {}

function M.read_buffer(bufnr)
  return vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
end

function M.read_file(path)
  local file = io.open(path, "rb") -- r read mode and b binary mode
  if not file then
    return nil
  end
  local content = file:read("*a") -- *a or *all reads the whole file
  file:close()
  return content
end

function M.exec(cmd, stdin)
  local tmp = os.tmpname()

  -- ensure command is properly formatted as a string
  local cmd_str = type(cmd) == "table" and table.concat(cmd, " ") or cmd
  local pipe = io.popen(cmd_str .. " 2>&1 > " .. tmp, "w")

  if not pipe then
    return nil
  end

  if stdin then
    pipe:write(stdin)
  end

  pipe:close()

  local output = M.read_file(tmp)
  os.remove(tmp)

  return output
end

return M

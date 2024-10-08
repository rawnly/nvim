local M = {}

function M.copy_content()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local content = table.concat(lines, "\n")

  vim.fn.setreg("+", content)

  vim.notify_once "File content copied"
end

function M.copy_git_url()
  local current_file = vim.fn.expand "%:p"
  local current_line = vim.fn.line "."
  local is_git_repo = vim.fn.system("git rev-parse --is-inside-work-tree"):match "true"

  if is_git_repo then
    local current_repo = vim.fn.systemlist("git remote get-url origin")[1]
    local current_branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD")[1]

    current_repo = current_repo:gsub("git@github.com:", "https://github.com/")
    current_repo = current_repo:gsub("%.git$", "")

    local repo_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]

    if repo_root then current_file = current_file:sub(#repo_root + 2) end

    local url = string.format("%s/blob/%s/%s#L%s", current_repo, current_branch, current_file, current_line)
    vim.fn.setreg("+", url)

    print("Copied to clipboard: " .. url)
  else
    vim.fn.setreg("+", current_file .. "#L" .. current_line)
    print("Copied full path to clipboard: " .. current_file .. "#L" .. current_line)
  end
end

function M.is_work_profile()
  local user = vim.fn.system "echo -n $USER"
  local work_user = "federico.vitale"

  return vim.fn.match(user, work_user)
end

return M

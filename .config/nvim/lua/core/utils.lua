-- Shared utility helpers used by multiple config files.

local M = {}

-- Convert a short GitHub repo name into a full plugin URL.
function M.gh(repo)
  return 'https://github.com/' .. repo
end

return M


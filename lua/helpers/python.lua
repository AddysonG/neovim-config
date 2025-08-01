local M = {}

local get_os = require('helpers.os').get_os

-- Global python path
local default_path = 'python'

-- Possible venv names. If you use a different venv name, add it in here.
local venv_directories = {
  '.venv',
  'venv',
}

function M.get_python_path()
  local subpath = get_os() == 'win' and 'Scripts/python.exe'
      or 'bin/python'

  local cwd = vim.fn.getcwd()

  for _, venv_dir in ipairs(venv_directories) do
    local exe_path = cwd .. '/' .. venv_dir .. '/' .. subpath

    if vim.fn.executable(exe_path) == 1 then
      return exe_path
    end
  end

  return default_path
end

return M

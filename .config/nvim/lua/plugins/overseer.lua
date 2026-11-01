-- Build/run task management for C/C++, Make, and CMake.

local gh = require('core.utils').gh
vim.pack.add { gh 'stevearc/overseer.nvim' }

local overseer = require 'overseer'
overseer.setup {
  task_list = {
    direction = 'bottom',
    min_height = 12,
    max_height = 20,
    default_detail = 1,
  },
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'OverseerOutput',

  callback = function()
    local height = math.max(8, math.floor(vim.o.lines * 0.20))

    vim.api.nvim_win_set_height(0, height)
  end,
})

local function find_root(markers)
  local start = vim.fn.expand '%:p:h'
  if start == '' then start = vim.fn.getcwd() end
  for _, marker in ipairs(markers) do
    local found = vim.fs.find(marker, { upward = true, path = start })[1]
    if found then return vim.fs.dirname(found) end
  end
  return vim.fn.getcwd()
end

local function gcc_components()
  return {
    { 'on_output_quickfix', open = false, set_diagnostics = true },
    'on_result_diagnostics',
    'default',
  }
end

local function parallelism()
  if vim.uv.available_parallelism then return tostring(vim.uv.available_parallelism()) end
  return '4'
end

overseer.register_template {
  name = 'C/C++: Build current file',
  condition = { filetype = { 'c', 'cpp' } },
  builder = function()
    local file = vim.fn.expand '%:p'
    local dir = vim.fn.expand '%:p:h'
    local name = vim.fn.expand '%:t:r'
    local is_cpp = vim.bo.filetype == 'cpp'
    return {
      cmd = is_cpp and 'g++' or 'gcc',
      args = is_cpp and { file, '-std=c++20', '-Wall', '-Wextra', '-Wpedantic', '-g', '-o', name }
        or { file, '-std=c17', '-Wall', '-Wextra', '-Wpedantic', '-g', '-o', name },
      cwd = dir,
      components = gcc_components(),
    }
  end,
}

overseer.register_template {
  name = 'C/C++: Run current executable',
  condition = { filetype = { 'c', 'cpp' } },
  builder = function()
    local dir = vim.fn.expand '%:p:h'
    local name = vim.fn.expand '%:t:r'
    return {
      cmd = './' .. name,
      cwd = dir,
      components = {
        {
          'open_output',
          direction = 'horizontal',
          on_start = 'always',
          focus = true,
        },
        'default',
      },
    }
  end,
}

overseer.register_template {
  name = 'Make: Build',
  builder = function()
    local root = find_root { 'Makefile', 'makefile' }
    return {
      cmd = 'make',
      args = { '-j' .. parallelism() },
      cwd = root,
      components = gcc_components(),
    }
  end,
}

overseer.register_template {
  name = 'Make: Clean',
  builder = function()
    local root = find_root { 'Makefile', 'makefile' }
    return {
      cmd = 'make',
      args = { 'clean' },
      cwd = root,
      components = { 'default' },
    }
  end,
}

overseer.register_template {
  name = 'CMake: Configure Debug',
  builder = function()
    local root = find_root { 'CMakeLists.txt' }
    return {
      cmd = 'cmake',
      args = { '-S', root, '-B', vim.fs.joinpath(root, 'build'), '-DCMAKE_BUILD_TYPE=Debug', '-DCMAKE_EXPORT_COMPILE_COMMANDS=ON' },
      cwd = root,
      components = gcc_components(),
    }
  end,
}

overseer.register_template {
  name = 'CMake: Build',
  builder = function()
    local root = find_root { 'CMakeLists.txt' }
    return {
      cmd = 'cmake',
      args = { '--build', vim.fs.joinpath(root, 'build'), '--parallel', parallelism() },
      cwd = root,
      components = gcc_components(),
    }
  end,
}

overseer.register_template {
  name = 'CMake: Clean',
  builder = function()
    local root = find_root { 'CMakeLists.txt' }
    return {
      cmd = 'cmake',
      args = { '--build', vim.fs.joinpath(root, 'build'), '--target', 'clean' },
      cwd = root,
      components = { 'default' },
    }
  end,
}

overseer.register_template {
  name = 'CMake: Run executable',
  builder = function()
    local root = find_root { 'CMakeLists.txt' }
    local build = vim.fs.joinpath(root, 'build')
    local executable = vim.fn.input 'Executable relative to build/: '
    return {
      cmd = vim.fs.joinpath(build, executable),
      cwd = build,
      components = { 'default' },
    }
  end,
}

local function run_task(name)
  overseer.run_task {
    name = name,
  }
end

vim.keymap.set('n', '<leader>br', '<cmd>OverseerRun<CR>', { desc = '[B]uild [R]un/select task' })
vim.keymap.set('n', '<leader>bt', '<cmd>OverseerToggle<CR>', { desc = '[B]uild [T]ask list' })
vim.keymap.set('n', '<leader>ba', '<cmd>OverseerTaskAction<CR>', { desc = '[B]uild task [A]ction' })
vim.keymap.set('n', '<leader>bl', '<cmd>OverseerRestartLast<CR>', { desc = '[B]uild [L]ast task again' })
vim.keymap.set('n', '<leader>bg', function() run_task 'C/C++: Build current file' end, { desc = '[B]uild with GCC/G++' })
vim.keymap.set('n', '<leader>rr', function() run_task 'C/C++: Run current executable' end, { desc = '[R]un current executable' })
vim.keymap.set('n', '<leader>bm', function() run_task 'Make: Build' end, { desc = '[B]uild with [M]ake' })
vim.keymap.set('n', '<leader>bc', function() run_task 'CMake: Configure Debug' end, { desc = '[B]uild [C]Make configure' })
vim.keymap.set('n', '<leader>bb', function() run_task 'CMake: Build' end, { desc = '[B]uild CMake' })
vim.keymap.set('n', '<F7>', '<cmd>OverseerRun<CR>', { desc = 'Select build task' })

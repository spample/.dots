-- Native debugging with nvim-dap + CodeLLDB.

local gh = require('core.utils').gh
vim.pack.add({
  gh('mfussenegger/nvim-dap'),
  gh('rcarriga/nvim-dap-ui'),
  gh('nvim-neotest/nvim-nio'),
})

local dap = require('dap')
local dapui = require('dapui')

dapui.setup({})

local codelldb = vim.fn.stdpath('data') .. '/mason/bin/codelldb'
dap.adapters.codelldb = {
  type = 'executable',
  command = codelldb,
}

local function program_path()
  return vim.fn.input('Executable: ', vim.fn.getcwd() .. '/', 'file')
end

dap.configurations.cpp = {
  {
    name = 'Launch executable (CodeLLDB)',
    type = 'codelldb',
    request = 'launch',
    program = program_path,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
  {
    name = 'Launch current-file executable',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.expand('%:p:h') .. '/' .. vim.fn.expand('%:t:r')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}
dap.configurations.c = dap.configurations.cpp

dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<F9>', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<S-F11>', dap.step_out, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = '[D]ebug [B]reakpoint' })
vim.keymap.set('n', '<leader>dB', function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, { desc = '[D]ebug conditional [B]reakpoint' })
vim.keymap.set('n', '<leader>dc', dap.continue, { desc = '[D]ebug [C]ontinue' })
vim.keymap.set('n', '<leader>di', dap.step_into, { desc = '[D]ebug step [I]nto' })
vim.keymap.set('n', '<leader>do', dap.step_over, { desc = '[D]ebug step [O]ver' })
vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = '[D]ebug step [O]ut' })
vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = '[D]ebug [R]EPL' })
vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = '[D]ebug [T]erminate' })
vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = '[D]ebug [U]I' })
vim.keymap.set({ 'n', 'v' }, '<leader>de', dapui.eval, { desc = '[D]ebug [E]valuate' })

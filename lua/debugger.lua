-- local dap = require("dap")
-- dap.adapters.codelldb = {
--   type = "server",
--   port = "${port}",
--   executable = {
--     command = "$HOME/AppData/Local/nvim-data/mason/bin/codelldb", -- I installed codelldb through mason.nvim
--     args = {"--port", "${port}"},
--     detached = false,
--   },
-- }
-- 
-- dap.configurations.rust = {
--   {
--     name = "Launch file",
--     type = "codelldb",
--     request = "launch",
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = '${workspaceFolder}',
--     stopOnEntry = false,
--   },
-- }

-- require("dap").adapters.lldb = {
-- 	type = "executable",
-- 	command = "/usr/bin/lldb-vscode", -- adjust as needed
-- 	name = "lldb",
-- }
-- 
-- local lldb = {
-- 	name = "Launch lldb",
-- 	type = "lldb", -- matches the adapter
-- 	request = "launch", -- could also attach to a currently running process
-- 	program = function()
-- 		return vim.fn.input(
-- 			"Path to executable: ",
-- 			vim.fn.getcwd() .. "/",
-- 			"file"
-- 		)
-- 	end,
-- 	cwd = "${workspaceFolder}",
-- 	stopOnEntry = false,
-- 	args = {},
-- 	runInTerminal = false,
-- }
-- 
-- require('dap').configurations.rust = {
-- 	lldb -- different debuggers or more configurations can be used here
-- }

local dap = require("dap")

-- Configure the adapter for Rust
dap.adapters.lldb = {
  type = 'executable',
  command = 'C:\\Program Files\\LLVM\\bin\\lldb-dap',
  name = 'lldb'
}

-- Configure the launch configurations
dap.configurations.rust = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}

-- DAP UI
local dapui = require("dapui")

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

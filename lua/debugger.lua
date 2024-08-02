local dap = require("dap")
require('dap.ext.vscode').load_launchjs(nil, {})

-- Configure the adapter for Rust
dap.adapters.lldb = {
  type = 'executable',
  command = 'C:\\Program Files\\LLVM\\bin\\lldb-dap',
  name = 'lldb'
}

-- Configure the launch configurations
-- dap.configurations.rust = {
--   {
--     name = "Launch",
--     type = "lldb",
--     request = "launch",
--     -- program = function()
--     --   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
--     -- end,
--     program = "${workspaceFolder}/target/debug/dungeon_crawler.exe",
--     cwd = '${workspaceFolder}',
--     stopOnEntry = false,
--     args = {},
--     runInTerminal = false,
--   },
-- }

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

vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

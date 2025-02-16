local dap = require('dap')
local dapui = require('dapui')

-- Setup nvim-dap-ui
dapui.setup()

-- Configure JavaScript/TypeScript adapter
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = { '/path/to/vscode-js-debug/dist/jsDebug.js' }, -- Replace with the actual path
}

-- Configure TypeScript debugging
dap.configurations.typescript = {
  {
    type = 'node2',
    request = 'launch',
    name = 'Launch Webpack Dev Server',
    program = '${workspaceFolder}/node_modules/.bin/webpack-dev-server', -- Adjust as needed
    args = { '--mode', 'development' },
    cwd = '${workspaceFolder}',
    sourceMaps = true,
    protocol = 'inspector',
    port = 8080,
    console = 'integratedTerminal',
    skipFiles = { '<node_internals>/**' },
  },
  {
    type = 'node2',
    request = 'attach',
    name = 'Attach to Process',
    port = 8080,
    restart = true,
    sourceMaps = true,
    localRoot = '${workspaceFolder}',
    remoteRoot = '/', -- Adjust for Docker or remote setups
    skipFiles = { '<node_internals>/**' },
  },
}

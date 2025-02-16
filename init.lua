vim.cmd('colorscheme vscode')
--vim.cmd('language en_US')

-- IMPORTS
require('vars')
require('plug')
require('opts')
require('keys')
require('lsp')
require('dbg')

require('mason').setup()
require('CopilotChat').setup {
  -- See Configuration section for options
}
require('nvim_comment').setup()
require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      'node_modules',
      '.git',
      '.cache',
      '.next',
      'dist',
      'build',
      'target',
      'vendor',
      'vscode-js-debug'
    }
  }
}

require 'nvim-treesitter.configs'.setup {
  ensure_installed = { 'markdown', 'markdown_inline', 'typescript', 'javascript' },
  highlight = {
    enable = true,
  },
}

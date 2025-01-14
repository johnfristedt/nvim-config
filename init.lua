vim.cmd("colorscheme codedark")
--vim.cmd("language en_US")

-- IMPORTS
--require('dbg')
require('vars')
require('plug')
require('opts')
require('keys')
require('lsp')

require("mason").setup()
require("CopilotChat").setup {
    -- See Configuration section for options
}
require('nvim_comment').setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "markdown", "markdown_inline", "typescript", "javascript" },
  highlight = {
    enable = true,
  },
}

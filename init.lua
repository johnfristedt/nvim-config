vim.cmd("colorscheme codedark")
--vim.cmd("language en_US")

-- IMPORTS
--require('dbg')
require('keys')      
require('opts')      
require('plug')      
require('vars')      
require('lsp')       

require("mason").setup()

-- Keybindings
--vim.api.nvim_set_keymap('n', '<leader>e', ':lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '[d', ':lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', ']d', ':lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>q', ':lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })

-- General Options
--vim.o.completeopt = 'menu,menuone,noselect'
--vim.o.termguicolors = true

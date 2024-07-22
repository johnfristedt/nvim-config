--[[ opts.lua ]]
local opt = vim.opt

-- [[ Context ]]
vim.opt.colorcolumn = '80'           -- str:  Show col for max line length
vim.opt.number = true                -- bool: Show line numbers
vim.opt.relativenumber = true        -- bool: Show relative line numbers
vim.opt.scrolloff = 4                -- int:  Min num lines of context
vim.opt.signcolumn = "yes"           -- str:  Show the sign column

-- [[ Filetypes ]]
vim.opt.encoding = 'utf8'            -- str:  String encoding to use
vim.opt.fileencoding = 'utf8'        -- str:  File encoding to use

-- [[ Theme ]]
vim.opt.syntax = "ON"                -- str:  Allow syntax highlighting
vim.opt.termguicolors = true         -- bool: If term supports ui color then enable

-- [[ Search ]]
vim.opt.ignorecase = true            -- bool: Ignore case in search patterns
vim.opt.smartcase = true             -- bool: Override ignorecase if search contains capitals
vim.opt.incsearch = true             -- bool: Use incremental search
vim.opt.hlsearch = false             -- bool: Highlight search matches

-- [[ Whitespace ]]
vim.opt.expandtab = true             -- bool: Use spaces instead of tabs
vim.opt.shiftwidth = 2               -- num:  Size of an indent
vim.opt.softtabstop = 2              -- num:  Number of spaces tabs count for in insert mode
vim.opt.tabstop = 2                  -- num:  Number of spaces tabs count for

-- [[ Splits ]]
vim.opt.splitright = true            -- bool: Place new window to right of current one
vim.opt.splitbelow = true            -- bool: Place new window below the current one

-- [[ Folding ]]
vim.opt.foldmethod = 'manual'

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300) 

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error 
-- Show inlay_hints more frequently 
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- Treesitter folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

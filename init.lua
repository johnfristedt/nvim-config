vim.cmd("colorscheme codedark")
vim.cmd("language en_US")
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- IMPORTS
require('vars')      -- Variables
-- require('opts')      -- Options
-- require('keys')      -- Keymaps
require('plug')      -- Plugins

vim.api.nvim_set_keymap("n", "<leader>tn", ":tabnew", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tm", ":tabmove<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tp", ":tabprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tn", ":tabnext<CR>", { noremap = true, silent = true })

-- Go to window 1
vim.api.nvim_set_keymap("n", "<leader>1", "1<C-w>w", { noremap = true, silent = true })
-- Go to window 2
vim.api.nvim_set_keymap("n", "<leader>2", "2<C-w>w", { noremap = true, silent = true })
-- Go to window 3
vim.api.nvim_set_keymap("n", "<leader>3", "3<C-w>w", { noremap = true, silent = true })
-- Go to window 4
vim.api.nvim_set_keymap("n", "<leader>4", "4<C-w>w", { noremap = true, silent = true })
-- Go to window 5
vim.api.nvim_set_keymap("n", "<leader>5", "5<C-w>w", { noremap = true, silent = true })
-- Go to window 6
vim.api.nvim_set_keymap("n", "<leader>6", "6<C-w>w", { noremap = true, silent = true })
-- Go to window 7
vim.api.nvim_set_keymap("n", "<leader>7", "7<C-w>w", { noremap = true, silent = true })
-- Go to window 8
vim.api.nvim_set_keymap("n", "<leader>8", "8<C-w>w", { noremap = true, silent = true })
-- Go to window 9
vim.api.nvim_set_keymap("n", "<leader>9", "9<C-w>w", { noremap = true, silent = true })

-- Mason Setup
require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
})
require("mason-lspconfig").setup()

vim.api.nvim_set_keymap("n", "<leader>tn", ":tabnew<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tm", ":tabmove<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tp", ":tabprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tn", ":tabnext<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>1", "1<C-w>w", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>2", "2<C-w>w", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>3", "3<C-w>w", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>4", "4<C-w>w", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>5", "5<C-w>w", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>6", "6<C-w>w", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>7", "7<C-w>w", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>8", "8<C-w>w", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>9", "9<C-w>w", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>w", "<C-w>w", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>c", ":CHADopen --nofocus<CR>", { noremap = true, silent = true })

-- DAP keybindings
vim.keymap.set('n', '<F5>', function() 
  vim.cmd('tabnew %')
  vim.fn.system('cargo build')
  require('dap').continue()
end)
vim.keymap.set('n', '<S-F5>', function() 
  vim.cmd('tabclose')
  require('dap').terminate() 
end)
vim.keymap.set('n', '<S-b>', function()
  vim.cmd('Cbuild') 
end)
vim.keymap.set('n', '<F9>', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)

-- Zen Mode
function toggle_zen_mode()
  require("zen-mode").toggle({
    window = {
        backdrop = 0, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        -- height and width can be:
        -- * an absolute number of cells when > 1
        -- * a percentage of the width / height of the editor when <= 1
        -- * a function that returns the width or the height
        width = 200, -- width of the Zen window
        height = 1, -- height of the Zen window
        -- by default, no options are changed for the Zen window
        -- uncomment any of the options below, or add other vim.wo options you want to apply
        options = {
          -- signcolumn = "no", -- disable signcolumn
          -- number = false, -- disable number column
          -- relativenumber = false, -- disable relative numbers
          -- cursorline = false, -- disable cursorline
          -- cursorcolumn = false, -- disable cursor column
          -- foldcolumn = "0", -- disable fold column
          -- list = false, -- disable whitespace characters
        },
      }
  })
end

vim.api.nvim_set_keymap('n', '<leader>z', ':lua toggle_zen_mode()<CR>', { noremap = true, silent = true })

vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true


-- Use F2 to rename symbol under cursor
-- nmap <silent> <F2> <Plug>(coc-rename)
vim.api.nvim_set_keymap('n', '<F2>', '<Plug>(coc-rename)', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })

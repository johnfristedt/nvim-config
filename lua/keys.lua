vim.api.nvim_set_keymap("n", "<leader>tn", ":tabnew", { noremap = true, silent = true })
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

vim.api.nvim_set_keymap("n", "<leader>c", ":CHADopen --nofocus<CR>", { noremap = true, silent = true })

-- Function to move the current buffer to a new vertical split
function move_to_right_split()
  -- Save the current buffer number
  local current_buf = vim.api.nvim_get_current_buf()
  
  -- Create a new vertical split
  vim.cmd('vsplit')
  
  -- Move to the new split (right split)
  vim.cmd('wincmd l')
  
  -- Open the current buffer in the new split
  vim.api.nvim_set_current_buf(current_buf)
end

-- Map the function to a key combination (e.g., <leader>mv)
vim.api.nvim_set_keymap('n', '<leader>mv', ':lua move_to_right_split()<CR>', { noremap = true, silent = true })

-- DAP keybindings
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<S-F5>', function() require('dap').terminate() end)
vim.keymap.set('n', '<F9>', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)

-- Telescope keybindings
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end)
-- vim.keymap.set('n', '<C-[>', function() require('telescope.builtin').lsp_references() end)

-- Hover
vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<cr>', { noremap = true, silent = true })

-- Zen Mode
function toggle_zen_mode()
  require("zen-mode").toggle({
    window = {
      width = 200
    }
  })
end

vim.api.nvim_set_keymap('n', '<leader>z', ':lua toggle_zen_mode()<CR>', { noremap = true, silent = true })

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

vim.api.nvim_set_keymap("n", "<leader>c", ":CHADopen<CR>", { noremap = true, silent = true })

-- Vimspector key mappings
vim.cmd([[
  nmap <F5> <cmd>call vimspector#Launch()<cr>
  nmap <F6> <cmd>call vimspector#Continue()<cr>
  nmap <F8> <cmd>call vimspector#Reset()<cr>
  nmap <F9> <cmd>call vimspector#StepOut()<cr>
  nmap <F10> <cmd>call vimspector#StepOver()<cr>
  nmap <F11> <cmd>call vimspector#StepInto()<cr>
]])

-- Define key mappings with vim.api.nvim_set_keymap
vim.api.nvim_set_keymap('n', 'Db', ':call vimspector#ToggleBreakpoint()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Dw', ':call vimspector#AddWatch()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'De', ':call vimspector#Evaluate()<cr>', { noremap = true, silent = true })


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

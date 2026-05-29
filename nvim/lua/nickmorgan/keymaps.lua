local map = vim.keymap.set

map('n', '<leader>?', function() require("which-key").show({ global = false }) end, { desc = 'Trigger Which Key' })

-- Easier window movement
map('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to bottom window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to top window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })

-- MiniFiles
map('n', '<leader>pv', ':Ex<CR>')

map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down', noremap = true })
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up', noremap = true })

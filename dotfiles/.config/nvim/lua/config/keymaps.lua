-- Inital config

-- Quit
vim.keymap.set('n', 'q', ':q<CR>', { noremap=true, silent=true })
vim.keymap.set('n', 'qq', ':q!<CR>', { noremap=true, silent=true })

-- Resize workspace split
vim.keymap.set('n', '<C-Left>', '<CMD>vertical resize -1<CR>', { silent = true })
vim.keymap.set('n', '<C-Right>', '<CMD>vertical resize +1<CR>', { silent = true })
vim.keymap.set('n', '<C-Down>', '<CMD>resize +1<CR>', { silent = true })
vim.keymap.set('n', '<C-Up>', '<CMD>resize -1<CR>', { silent = true })

-- Move to workspace split
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap=true, silent=true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap=true, silent=true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap=true, silent=true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap=true, silent=true })

-- Undo/Redo
vim.api.nvim_set_keymap('n', '<C-z>', 'u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-z>', '<Esc>u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-z>', '<Esc>u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-y>', '<C-r>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-y>', '<Esc><C-r>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-y>', '<Esc><C-r>', { noremap = true, silent = true })

-- Turn off highlight
vim.api.nvim_set_keymap('n', '<Esc>', ':noh<CR><Esc>', { noremap = true, silent = true })

-- Split/Vertical split
vim.keymap.set('n', '<F5>', ':sp<CR>', { noremap=true, silent=true })
vim.keymap.set('n', '<F6>', ':vs<CR>', { noremap=true, silent=true })

vim.g.mapleader = ' '
vim.keymap.set({ 'n' }, '<leader>pv', vim.cmd.Explore)
vim.keymap.set({ 'n', 'i' }, '<C-z>', vim.cmd.undo)
vim.keymap.set({ 'n', 'i' }, '<C-r>', vim.cmd.redo)


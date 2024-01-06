vim.g.mapleader = ' '
vim.keymap.set({ 'n' }, '<leader>pv', vim.cmd.Explore)
vim.keymap.set({ 'n', 'i' }, '<C-z>', vim.cmd.undo)
vim.keymap.set({ 'n', 'i' }, '<C-r>', vim.cmd.redo)
vim.keymap.set({ 't' }, '<Esc>', [[<C-\><C-n>]])
vim.keymap.set({ 'n' }, '<Esc>', vim.cmd.nohlsearch)

vim.g.mapleader = ' '

local opts = { noremap = true }

-- buffers
vim.keymap.set({ 'n' }, '<leader>]', function() vim.cmd(':bnext') end)
vim.keymap.set({ 'n' }, '<leader>[', function() vim.cmd(':bprevious') end)
vim.keymap.set({ 'n' }, '<leader>bd', function () vim.cmd(':bdelete') end)
vim.keymap.set({ 'n' }, '<leader>b1', function() vim.cmd(':buffer 1') end)
vim.keymap.set({ 'n' }, '<leader>b2', function() vim.cmd(':buffer 2') end)
vim.keymap.set({ 'n' }, '<leader>b3', function() vim.cmd(':buffer 3') end)
vim.keymap.set({ 'n' }, '<leader>b4', function() vim.cmd(':buffer 4') end)
vim.keymap.set({ 'n' }, '<leader>b5', function() vim.cmd(':buffer 5') end)
vim.keymap.set({ 'n' }, '<leader>b6', function() vim.cmd(':buffer 6') end)
vim.keymap.set({ 'n' }, '<leader>b7', function() vim.cmd(':buffer 7') end)
vim.keymap.set({ 'n' }, '<leader>b8', function() vim.cmd(':buffer 8') end)
vim.keymap.set({ 'n' }, '<leader>b9', function() vim.cmd(':buffer 9') end)

-- file navigation
vim.keymap.set({ 'n' }, '<leader>pv', vim.cmd.Explore)

-- editing
vim.keymap.set({ 'n', 'i' }, '<C-z>', vim.cmd.undo)
vim.keymap.set({ 'n', 'i' }, '<C-r>', vim.cmd.redo)
vim.keymap.set({ 't' }, '<Esc>', [[<C-\><C-n>]])
vim.keymap.set({ 'n' }, '<Esc>', vim.cmd.nohlsearch)


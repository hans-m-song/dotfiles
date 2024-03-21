require('bufferline').setup({
    options = {
        diagnostics = "nvim_lsp",
    },
})

vim.keymap.set({ 'n' }, '<leader>]', function() vim.cmd(':bnext') end)
vim.keymap.set({ 'n' }, '<leader>[', function() vim.cmd(':bprevious') end)
vim.keymap.set({ 'n' }, '<leader>bd', function () vim.cmd(':bdelete') end)

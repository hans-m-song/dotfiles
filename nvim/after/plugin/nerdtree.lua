vim.g.NERDTreeFileLines = 1
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeHijackNetrw = 1
vim.g.NERDTreeChDirMode = 3

vim.keymap.set({ 'n', 'i' }, '<C-b>', vim.cmd.NERDTreeToggle)
vim.keymap.set({ 'n' }, '<leader>r', vim.cmd.NERDTreeFind)

-- exit if NERDTree is the only buffer
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    pattern = '*',
    command = [[if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif]]
})


local accept_word = function()
    vim.fn['copilot#Accept']('')
    local queued = vim.fn['copilot#TextQueuedForInsertion']()
    return vim.fn.split(queued, [=[[ ."']\zs]=])[1]
end

vim.keymap.set({ 'i' }, '<C-l>', accept_word, { expr = true, remap = false })

require("hans-m-song")

local find_root = function()
    local gitdir = vim.fs.find(
        { '.git' },
        {
            upward = true,
            stop = vim.loop.os_homedir(),
            path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
        }
    )

    if #gitdir > 0 then
        return vim.fs.dirname(gitdir[1])
    end

    if vim.b.NERDTree then
        return '/' .. vim.fn.join(vim.b.NERDTree.root.path.pathSegments, '/')
    end

    return vim.fn.getcwd()
end


vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    pattern = '*',
    callback = function()
        local current_path = vim.fn.getcwd()
        local new_path = find_root()
        print(current_path .. ' -> ' .. new_path)
        vim.cmd.cd(new_path)
    end,
})

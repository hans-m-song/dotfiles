local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')

lsp.preset('recommended')
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set({ 'n' },      '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set({ 'n' },      '<leader>vd',  vim.diagnostic.open_float, opts)
    vim.keymap.set({ 'n' },      '<leader>vca', vim.lsp.buf.code_action, opts)
    vim.keymap.set({ 'n' },      '<leader>vaf', vim.lsp.buf.format, opts)
    vim.keymap.set({ 'n' },      '[d', vim.diagnostic.goto_next, opts)
    vim.keymap.set({ 'n' },      ']d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set({ 'n', 'i' }, '<C-d>', vim.diagnostic.open_float, opts)
    vim.keymap.set({ 'n', 'i' }, '<C-k>', vim.lsp.buf.hover, opts)
    vim.keymap.set({ 'n', 'i' }, '<F2>', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'i' }, '<F12>', vim.lsp.buf.definition, opts)
    vim.keymap.set({ 'n', 'i' }, '<C-F12>', vim.lsp.buf.references, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
    },
    handlers = {
        lsp.default_setup,

        -- hls = function()
        --     lspconfig.hls.setup({
        --         settings = {
        --             haskell = {
        --                 formattingProvider = 'fourmolu',
        --             },
        --         },
        --     })
        -- end,

        lua_ls = function()
            lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
        end,

        yamlls = function()
            lspconfig.yamlls.setup({
                settings = {
                    yaml = {
                        customTags = {
                            '!And',
                            '!Base64',
                            '!Cidr',
                            '!Condition',
                            '!Equals',
                            '!FindInMap',
                            '!GetAZs',
                            '!GetAtt',
                            '!If',
                            '!ImportValue',
                            '!Join',
                            '!Not',
                            '!Or',
                            '!Ref',
                            '!Ref',
                            '!Select',
                            '!Split',
                            '!Sub',
                            '!Transform',
                        },
                    }
                }
            })
        end,
    },
})

require('mason-tool-installer').setup({
    ensure_installed = {
        -- lsp
        -- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
        'ansiblels',
        'bashls',
        'docker_compose_language_service',
        'dockerls',
        'eslint',
        'golangci_lint_ls',
        'gopls',
        'hls',
        'html',
        -- 'htmx',
        'jsonls',
        'lua_ls',
        'pylsp',
        -- 'rust_analyzer',
        'sqlls',
        'terraformls',
        'tsserver',
        'vimls',
        'yamlls',

        -- dap
        'delve',
        -- 'haskell-debug-adapter',

        -- linter
        'ansible-lint',
        'cfn-lint',
        'golangci-lint',
        'jsonlint',
        'shellcheck',
        'tflint',
        'yamllint',

        -- formatter
        'black',
        -- 'fourmolu',
        'hclfmt',
        'mdformat',
        'jsonlint',
        'shfmt',
    }
})

-- local conform = require('conform')
-- conform.setup({
--     formatters_by_ft = {
--         go = { 'gofmt' },
--         haskell = { 'fourmolu' },
--         javascript = { 'prettier' },
--         json = { 'jsonlint' },
--         lua = { 'stylua' },
--         markdown = { 'mdformat' },
--         python = { 'isort', 'black' },
--         terraform = { 'terraform_fmt' },
--         typescript = { 'prettier' },
--         yaml = { 'yamllint' },
--     }
-- })

-- vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
--     pattern = '*',
--     callback = function(args)
--         conform.format({ bufnr = args.buf })
--     end,
-- })

local cmp = require('cmp')
cmp.setup({
    formatting = lsp.cmp_format(),
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer',  keyword_length = 3 },
    },
    mapping = {
        ['<Down>'] = cmp.config.disable,
        ['<Up>'] = cmp.config.disable,
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.close(),
    },
})

require('nvim-treesitter.configs').setup({
    -- https://github.com/nvim-treesitter/nvim-treesitter/#supported-languages
    ensure_installed = {
        'bash',
        'c',
        'diff',
        'dockerfile',
        'git_config',
        'git_rebase',
        'gitattributes',
        'gitcommit',
        'gitignore',
        'go',
        'gomod',
        'gosum',
        -- 'haskell',
        'hcl',
        'html',
        'ini',
        'javascript',
        'json',
        'jsonc',
        'lua',
        'markdown',
        'python',
        'query',
        -- 'rust',
        'sql',
        'ssh_config',
        'terraform',
        'toml',
        'typescript',
        'vim',
        'vimdoc',
        'xml',
        'yaml',
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = false,

    highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true,
    },
})

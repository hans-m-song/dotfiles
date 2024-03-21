local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set({ 'n' }, '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set({ 'n' }, '<leader>vd', vim.diagnostic.open_float, opts)
    vim.keymap.set({ 'n' }, '<leader>vca', vim.lsp.buf.code_action, opts)
    vim.keymap.set({ 'n' }, '<leader>vaf', vim.lsp.buf.format, opts)
    vim.keymap.set({ 'n' }, '[d', vim.diagnostic.goto_next, opts)
    vim.keymap.set({ 'n' }, ']d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set({ 'n', 'i' }, '<C-d>', vim.diagnostic.open_float, opts)
    vim.keymap.set({ 'n', 'i' }, '<C-k>', vim.lsp.buf.hover, opts)
    vim.keymap.set({ 'n', 'i' }, '<F2>', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'i' }, '<F12>', vim.lsp.buf.definition, opts)
    vim.keymap.set({ 'n', 'i' }, '<C-F12>', vim.lsp.buf.references, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    -- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
    ensure_installed = {
        'ansiblels',
        'bashls',
        'docker_compose_language_service',
        'dockerls',
        'eslint',
        'golangci_lint_ls',
        'gopls',
        'hls',
        'html',
        'htmx',
        'jsonls',
        'lua_ls',
        'pylsp',
        'rust_analyzer',
        'sqlls',
        'tflint',
        'tsserver',
        'vimls',
        'yamlls',
    },
    handlers = {
        lsp.default_setup,
        lua_ls = function()
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
        end,

        hls = function()
            require('lspconfig').hls.setup({
                settings = {
                    haskell = {
                        formattingProvider = 'fourmolu',
                    },
                },
            })
        end,

        yamlls = function()
            require('lspconfig').yamlls.setup({
                settings = {
                    yaml = {
                        schemaStore = {
                            enable = true,
                        },
                        schemas = {
                            'https://raw.githubusercontent.com/awslabs/goformation/v4.18.2/schema/cloudformation.schema.json: "/*"',
                        },
                        customTags = {
                            "!Base64",
                            "!Cidr",
                            "!And",
                            "!Equals",
                            "!If",
                            "!Not",
                            "!Or",
                            "!Condition",
                            "!FindInMap",
                            "!GetAtt",
                            "!GetAZs",
                            "!ImportValue",
                            "!Join",
                            "!Select",
                            "!Split",
                            "!Sub",
                            "!Transform mapping",
                            "!Ref",
                        },
                    }
                }
            })
        end,
    },
})

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

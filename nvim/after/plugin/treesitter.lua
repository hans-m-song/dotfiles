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
        'haskell',
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
        'rust',
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
    auto_install = true,

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

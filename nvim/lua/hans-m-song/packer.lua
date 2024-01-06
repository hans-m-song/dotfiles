vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- packer
    use({ 'wbthomason/packer.nvim' })

    -- theme
    use({ 'navarasu/onedark.nvim' })
    use({ 'nvim-lualine/lualine.nvim', requires = { { 'nvim-tree/nvim-web-devicons' } } })

    -- syntax
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    -- use({ 'nvim-treesitter/nvim-treesitter-refactor' })
    use({ 'nvim-treesitter/playground', requires = { 'nvim-treesitter/nvim-treesitter' } })
    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- language servers
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- lsp
            { 'neovim/nvim-lspconfig' },
            -- autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    })

    -- navigation
    use({
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    })
    use({ 'theprimeagen/harpoon' })
    use({ 'preservim/nerdtree' })

    -- utility
    use({ 'mbbill/undotree' })
    use({ 'tpope/vim-fugitive' })
    use({ 'github/copilot.vim' })
end)

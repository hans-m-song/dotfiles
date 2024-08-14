return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        modules = {},
        -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
        ensure_installed = {
          "bash",
          "diff",
          "dockerfile",
          "git_config",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "gitignore",
          "go",
          "gomod",
          "gosum",
          "hcl",
          "html",
          "ini",
          "javascript",
          "json",
          "jsonc",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "sql",
          "ssh_config",
          "terraform",
          "toml",
          "typescript",
          "vim",
          "vimdoc",
          "xml",
          "yaml",
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        sync_install = false,
        auto_install = false,
        context_commentstring = {
          enable = true,
          autocmd = false,
        },
        autopairs = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },

  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    dependencies = {
      -- language servers
      "SmiteshP/nvim-navic",
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- autocompletion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      -- snippets
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local lsp = require("lsp-zero")
      local lspconfig = require("lspconfig")
      local navic = require("nvim-navic")
      local cmp = require("cmp")
      local cmp_nvim = require("cmp_nvim_lsp")
      local mason = require("mason")
      local mason_lspconfig = require("mason")

      lsp.extend_lspconfig({
        sign_text = true,
        capabilities = cmp_nvim.default_capabilities(),
        lsp_attach = function(client, bufnr)
          local opts = { buffer = bufnr }

          print("lsp_attach")
          vim.keymap.set({ 'n' },      'K',    vim.lsp.buf.hover, opts)
          vim.keymap.set({ 'n' },      'gd',   vim.lsp.buf.definition, opts)
          vim.keymap.set({ 'n' },      'gD',   vim.lsp.buf.declaration, opts)
          vim.keymap.set({ 'n' },      'gi',   vim.lsp.buf.implementation, opts)
          vim.keymap.set({ 'n' },      'go',   vim.lsp.buf.type_definition, opts)
          vim.keymap.set({ 'n' },      'gr',   vim.lsp.buf.references, opts)
          vim.keymap.set({ 'n' },      'gs',   vim.lsp.buf.signature_help, opts)
          vim.keymap.set({ 'n' },      '<F2>', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)
          vim.keymap.set({ 'n' },      '<F4>', vim.lsp.buf.code_action, opts)

          if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, bufnr)
          end
        end,
      })

      mason.setup({})
      mason_lspconfig.setup({
        -- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
        ensure_installed = {
          "ansiblels",
          "bashls",
          "docker_compose_language_service",
          "dockerls",
          "golangci_lint_ls",
          "graphql",
          "helm_ls",
          "html",
          "templ",
          "htmx",
          "eslint",
          "jsonls",
          "lua_ls",
          "tflint",
          "vimls",
          "yamlls",
        },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({})
          end,
          lua_ls = function()
            lspconfig.lua_ls.setup({
              on_init = function(client)
                lsp.nvim_lua_settings(client, {})
              end,
            })
          end,
        }
      })

      local cmp_action = lsp.cmp_action()
      cmp.setup({
        preselect = cmp.PreselectMode.None,
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
        mapping = {
          ["<Tab>"]     = cmp.mapping.confirm({ select = false }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["C-p>"]      = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ["C-n>"]      = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
      })
    end,
  },
}

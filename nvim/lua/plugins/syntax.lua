return {
  {
    "nvim-treesitter/playground",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { 'BufReadPre', 'BufNewFile' },
    main = "nvim-treesitter.configs",
    ---@type TSConfig
    opts = {
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
      sync_install = false,
      auto_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    },
  },

  {
    "folke/lazydev.nvim",
    ft = { "lua" },
    dependencies = {
      "Bilal2453/luvit-meta",
      "justinsgithub/wezterm-types",
    },
    ---@type lazydev.Config
    opts = {
      library = {
        "lazy.nvim",
        "luvit-meta/library",
        { path = "wezterm-types", mods = { "wezterm" } },
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = { "VeryLazy" },
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")
      local lsp_zero = require("lsp-zero")

      mason_lspconfig.setup({
        ensure_installed = {
          -- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
          "ansiblels",
          "bashls",
          "docker_compose_language_service",
          "dockerls",
          "eslint",
          "golangci_lint_ls",
          "graphql",
          "helm_ls",
          "html",
          "htmx",
          "jsonls",
          "lua_ls",
          "pyright",
          "templ",
          "terraformls",
          "tflint",
          "tsserver",
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
                lsp_zero.nvim_lua_settings(client, {})
              end,
            })
          end,
        }
      })
    end,
  },

  {
    "williamboman/mason.nvim",
    event = { "VeryLazy" },
    build = ":MasonUpdate",
    opts = {
      ui = {
        border = "single",
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    event = { "VeryLazy" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        preselect = cmp.PreselectMode.None,
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "lazydev", group_index = 0 },
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
            luasnip.lsp_expand(args.body)
          end,
        },
      })
    end
  },

  {
    "VonHeikemen/lsp-zero.nvim",
    event = { "VeryLazy" },
    branch = "v4.x",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "SmiteshP/nvim-navic",
      "neovim/nvim-lspconfig",
    },
    config = function()
      local lsp_zero = require("lsp-zero")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local navic = require("nvim-navic")

      vim.opt.winbar = "%{%v:lua.vim.fn.expand('%F')%} > %{%v:lua.require'nvim-navic'.get_location()%}"

      lsp_zero.extend_lspconfig({
        sign_text = true,
        capabilities = cmp_nvim_lsp.default_capabilities(),
        lsp_attach = function(client, bufnr)
          local opts = { buffer = bufnr }

          vim.keymap.set({ 'n' }, 'K',    vim.lsp.buf.hover, opts)
          vim.keymap.set({ 'n' }, 'gd',   vim.lsp.buf.definition, opts)
          vim.keymap.set({ 'n' }, 'gD',   vim.lsp.buf.declaration, opts)
          vim.keymap.set({ 'n' }, 'gi',   vim.lsp.buf.implementation, opts)
          vim.keymap.set({ 'n' }, 'go',   vim.lsp.buf.type_definition, opts)
          vim.keymap.set({ 'n' }, 'gr',   vim.lsp.buf.references, opts)
          vim.keymap.set({ 'n' }, 'gs',   vim.lsp.buf.signature_help, opts)
          vim.keymap.set({ 'n' }, '<F2>', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)
          vim.keymap.set({ 'n' }, '<F4>', vim.lsp.buf.code_action, opts)

          if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, bufnr)
          end
        end,
      })
    end,
  },
}

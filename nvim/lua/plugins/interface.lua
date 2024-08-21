return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local onedark = require("onedark")
      onedark.setup({ style = "dark" })
      onedark.load()
      vim.cmd("colorscheme onedark")
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    main = "ibl",
  },

  {
    "folke/noice.nvim",
    event = { "VeryLazy" },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      local notify = require("notify")
      local noice = require("noice")

      notify.setup({
        fps = 60,
        top_down = false,
      })

      vim.notify = notify

      noice.setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          signature = {
            enabled = true,
          },
          hover = {
            enabled = true,
          },
        },
        presets = {
          bottom_search = false,
          command_palette = false,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = false,
        },
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "auto",
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    enabled = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        diagnostics = "nvim_lsp"
      },
    },
  },

  {
    "stevearc/dressing.nvim",
    event = { "VeryLazy" },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "VeryLazy" },
  },

  {
    "ap/vim-css-color",
    event = { "VeryLazy" },
  },
}

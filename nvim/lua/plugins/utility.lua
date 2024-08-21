return {
  {
    "tpope/vim-commentary",
    event = { "VeryLazy" },
  },

  {
    "tpope/vim-surround",
    event = { "VeryLazy" },
  },

  {
    "tpope/vim-rhubarb",
    event = { "VeryLazy" },
  },

  {
    "tpope/vim-fugitive",
    event = { "VeryLazy" },
  },

  {
    "ap/vim-css-color",
    event = { "VeryLazy" },
  },


  {
    "lewis6991/gitsigns.nvim",
    event = { "VeryLazy" },
    ---@type Gitsigns.Config
    opts = {
      -- signcolomn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 500,
      },
    },
  },
}

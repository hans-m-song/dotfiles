local WINDOW_RATIO_WIDTH = 0.6
local WINDOW_RATIO_HEIGHT = 0.8

return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
      local nt = require("nvim-tree")
      local nt_api = require("nvim-tree.api")

      nt.setup({
        view = {
          number = true,
          float = {
            enable = true,
            open_win_config = function()
              local screen_w = vim.opt.columns:get()
              local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
              local window_w = screen_w * WINDOW_RATIO_WIDTH
              local window_h = screen_h * WINDOW_RATIO_HEIGHT
              local window_w_int = math.floor(window_w)
              local window_h_int = math.floor(window_h)
              local center_x = (screen_w - window_w) / 2
              local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
              return {
                border = 'rounded',
                relative = 'editor',
                row = center_y,
                col = center_x,
                width = window_w_int,
                height = window_h_int,
              }
            end,
          },
          width = function()
            return math.floor(vim.opt.columns:get() * WINDOW_RATIO_WIDTH)
          end,
        },
        git = {
          enable = true,
        },
        modified = {
          enable = true,
        },
        actions = {
          change_dir = {
            restrict_above_cwd = true,
          },
          expand_all = {
            exclude = { ".git", ".terraform", "node_modules" },
          },
        },
      })

      vim.keymap.set({ "n" }, "<leader>nt", nt_api.tree.toggle)
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope.builtin")
      vim.keymap.set({ "n" }, "<leader>ff", telescope.find_files)
      vim.keymap.set({ "n" }, "<leader>fg", telescope.live_grep)
      vim.keymap.set({ "n" }, "<leader>fs", telescope.current_buffer_fuzzy_find)
      vim.keymap.set({ "n" }, "<leader>fb", telescope.buffers)
      vim.keymap.set({ "n" }, "<leader>fh", telescope.highlights)
    end,
  },
}

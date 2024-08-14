local WINDOW_RATIO_WIDTH = 0.5
local WINDOW_RATIO_HEIGHT = 0.8

return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = function()
            return math.floor(vim.opt.columns:get() * WINDOW_RATIO_WIDTH)
          end,
          float = {
            enable = true,
            open_win_config = function()
              local screen_w = vim.opt.columns:get()
              local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
              local window_w = screen_w * WINDOW_RATIO_WIDTH
              local window_h = screen_h * WINDOW_RATIO_HEIGHT
              return {
                relative = "editor",
                row = (screen_w - window_w) / 2,
                col = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get(),
                width = math.floor(window_w),
                height = math.floor(window_h),
              }
            end,
          },
        },
      })
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

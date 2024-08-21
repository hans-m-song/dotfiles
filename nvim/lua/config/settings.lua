-- misc
vim.opt.showmode = false
vim.opt.compatible = false
vim.opt.backspace = 'indent,eol,start'
vim.opt.clipboard = 'unnamed,unnamedplus'
vim.opt.termguicolors = true

-- gutter
vim.opt.number = true
vim.opt.relativenumber = true

-- indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- fs
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- remaps
vim.keymap.set({ "n", "i" }, "<C-z>", vim.cmd.undo)
vim.keymap.set({ "n", "i" }, "<C-r>", vim.cmd.redo)
vim.keymap.set({ 't' }, '<Esc>', [[<C-\><C-n>]])
vim.keymap.set({ 'n' }, '<Esc>', vim.cmd.nohlsearch)
vim.keymap.set({ 'n', 'v' }, '/', [[/\v]])
vim.keymap.set({ 'n', 'c' }, '%s/', [[%s/\v]])

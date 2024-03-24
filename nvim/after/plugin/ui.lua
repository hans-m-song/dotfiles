-- theme
require('onedark').setup({ style = 'dark' })
require('onedark').load()
vim.cmd.colorscheme('onedark')

-- lualine
require('lualine').setup({
	options = {
		theme = 'auto'
	}
})

-- bufferline
require('bufferline').setup({
    options = {
        diagnostics = "nvim_lsp",
    },
})


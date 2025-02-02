require("config.lazy")

vim.opt.shiftwidth = 2
vim.opt.tabstop = 4
vim.opt.clipboard = "unnamedplus"
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- source the current file
vim.keymap.set("n", "<space><space>", ":nohl<CR>")
-- source the current file
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
-- run the current file
vim.keymap.set("n", "<space>x", ":.lua<CR>")
-- run the highlighted code
vim.keymap.set("v", "<space>x", ":lua<CR>")
-- the most important keymap of all time
vim.keymap.set("i", "jk", "<C-c>")

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

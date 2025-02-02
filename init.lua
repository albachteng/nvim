require("config.lazy")

vim.opt.shiftwidth = 2
vim.opt.tabstop = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- add errors to quickfix
vim.keymap.set("n", "<space><space>e", ":lua vim.diagnostic.setqflist() <CR><C-w>k")
-- cycle through the quickfix list
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>")
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
-- oil
vim.keymap.set("n", "<space>e", ":Oil<CR>")
-- mini terminal
local job_id = 0
vim.keymap.set("n", "<space>st", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 15)
	job_id = vim.bo.channel
end)
-- exit insert mode in terminal
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>")
-- from terminal mode, close the terminal and return to previous buffer
vim.keymap.set("t", "<C-o>", "<C-\\><C-n>:q<CR>")

-- example send command to the terminal
vim.keymap.set("n", "<space>example", function()
	vim.fn.chansend(job_id, { "ls -la\r\n" })
end)

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

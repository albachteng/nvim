require("config.lazy")

Func = function(x) 
	local number = 5
	local string = "nonsense"
	local single = 'also nonsense'
	local crazy = [[ this 
	is a multi line and literal ]]
	local truth, lies = true, false
	local nothing = nil
	print("hello, " .. number .. string .. single .. crazy )

	local list = {1, 2, true, false}
	for i = 1, #list do
		print(i, list[i])
	end
	for i, val in ipairs(list) do
		print(i, list[i], "second time")
	end
	local t = {
		literal_key = "a string",
		["some expression"] = "also works",
		[function() end] = true
	}
	for key, value in pairs(t) do
		print(key, value)
	end
	print(list[1])
	print(t['function() end'])
	
end

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- source the current file
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
-- run the current file
vim.keymap.set("n", "<space>x", ":.lua<CR>")
-- run the highlighted code
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text', 
    desc = 'Highlight when yanking (copying) text', 
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', {clear = true}), 
    callback = function() 
	    vim.highlight.on_yank()
    end,
})

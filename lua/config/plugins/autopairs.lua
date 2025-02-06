return {
	{
		"windwp/nvim-autopairs",
		build = ":TSUpdate",
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true,
				fast_wrap = {},
			})
		end
	}
}

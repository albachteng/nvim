return {
	{
		'saghen/blink.cmp',
		-- optional: provides snippets for the snippet source
		dependencies = 'rafamadriz/friendly-snippets',

		-- use a release tag to download pre-built binaries
		version = '*0.*',
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = 'default' },
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = 'mono'
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
			},
			signature = { enabled = true }
		},
		opts_extend = { "sources.default" }
	}
}

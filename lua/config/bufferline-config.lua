require("bufferline").setup({
	options = {
		hover = {
			enabled = true,
			delay = 150,
			reveal = { "close" },
		},
		diagnostics = "nvim-lsp",
		show_tab_indicators = true,
	},
})

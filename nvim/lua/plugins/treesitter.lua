require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"html",
		"lua",
		"javascript",
		"typescript",
		"tsx",
		"css",
		"markdown",
		"markdown_inline",
		"python",
	},
	highlight = { enable = true, additional_vim_regex_highlighting = false },
	indent = { enable = true },
})

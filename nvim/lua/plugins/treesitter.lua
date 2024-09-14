require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"html",
		"lua",
		"javascript",
		"typescript",
		"tsx",
		"css",
		"markdown",
		"python",
	},
	highlight = { enable = true },
	indent = { enable = true },
})

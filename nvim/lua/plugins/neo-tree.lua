require("nvim-tree").setup({
	filters = {
		dotfiles = false,
		custom = { "node_modules", ".DS_Store" },
	},
	view = {
		width = 26,
	},
	git = {
		enable = true,
		ignore = false,
	},
})

require("nvim-tree").setup({
	filters = {
		dotfiles = false,
		custom = { "node_modules", ".DS_Store", ".git" },
	},
	view = {
		width = 24,
	},
	git = {
		enable = true,
		ignore = false,
	},
})

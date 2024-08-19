require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		python = { "black" },
		markdown = { "prettier" },
	},
	format_on_save = {
		lsp_fallback = true,
	},
})

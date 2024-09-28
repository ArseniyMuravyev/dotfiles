vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

local on_attach = function(client, bufnr)
	-- Attach tailwindcss-colors only if the current client is Tailwind CSS
	if client.name == "tailwindcss" then
		local status_ok, tailwindcss_colors = pcall(require, "tailwindcss-colors")
		if status_ok then
			tailwindcss_colors.buf_attach(bufnr)
		else
			print("tailwindcss-colors plugin not found.")
		end
	end

	-- Existing key mappings and user command
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	-- Set up key mappings
	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- User command for formatting
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		if vim.lsp.buf.format then
			vim.lsp.buf.format()
		elseif vim.lsp.buf.formatting then
			vim.lsp.buf.formatting()
		end
	end, { desc = "Format current buffer with LSP" })
end

require("mason").setup()

local servers = { "ts_ls", "html", "pyright", "emmet_language_server", "tailwindcss", "lua_ls", "cssls", "gopls" }

require("mason-lspconfig").setup({
	ensure_installed = servers,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

for _, lsp in ipairs(servers) do
	require("lspconfig")[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

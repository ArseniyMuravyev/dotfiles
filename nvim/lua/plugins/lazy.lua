local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = "VeryLazy",
	},
	{
		"windwp/nvim-ts-autotag",
		event = "VeryLazy",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"j-hui/fidget.nvim",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
		keys = {
			{
				"sf",
				function()
					local telescope = require("telescope")

					local function telescope_buffer_dir()
						return vim.fn.expand("%:p:h")
					end

					telescope.extensions.file_browser.file_browser({
						path = "%:p:h",
						cwd = telescope_buffer_dir(),
						respect_gitignore = false,
						hidden = true,
						grouped = true,
						previewer = true,
						initial_mode = "normal",
						layout_config = { height = 50, weight = 500 },
					})
				end,
				desc = "Open File Browser with the path of the current buffer",
			},
		},
		config = function()
			require("telescope").setup({
				extensions = {
					file_browser = {
						theme = "dropdown",
						hijack_netrw = true,
						mappings = {
							["n"] = {
								["N"] = require("telescope").extensions.file_browser.actions.create,
								["D"] = require("telescope").extensions.file_browser.actions.remove,
								["R"] = require("telescope").extensions.file_browser.actions.rename,
								["h"] = require("telescope").extensions.file_browser.actions.goto_parent_dir,
								["/"] = function()
									vim.cmd("startinsert")
								end,
							},
						},
					},
				},
			})
			require("telescope").load_extension("file_browser")
		end,
	},
	{
		"folke/noice.nvim",
		config = function()
			require("noice").setup({ presets = { inc_rename = true } })
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 1500,
			background_colour = "#000000",
			render = "compact",
		},
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		opts = function(_, opts)
			opts.scroll = {
				enable = false,
			}
		end,
	},
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	"folke/zen-mode.nvim",
	"xiyaowong/transparent.nvim",
})

local function set_theme_based_on_system()
	-- Используем os.execute для определения системной темы (работает для Linux/MacOS)
	local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null") -- macOS
	local result = handle:read("*a")
	handle:close()

	-- Устанавливаем тему в зависимости от результата
	if result:match("Dark") then
		vim.o.background = "dark"
		vim.cmd("colorscheme tokyonight")
	else
		vim.o.background = "light"
		vim.cmd("colorscheme tokyonight-day")
	end
end

-- Вызываем функцию при старте Neovim
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		set_theme_based_on_system()
	end,
})

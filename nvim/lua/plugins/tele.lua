-- Telescope setup
require("telescope").setup({
	defaults = {
		prompt_prefix = "   ",
		selection_caret = " ",
		entry_prefix = " ",
		layout_strategy = "horizontal",
		extensions_list = { "themes", "terms" },

		layout_config = {
			horizontal = {
				size = {
					width = "95%",
					height = "95%",
				},
			},
		},
		pickers = {
			find_files = {
				find_command = {
					"fd",
					".",
					"--type",
					"file",
					"--hidden",
					"--strip-cwd-prefix",
				},
			},
		},
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-j>"] = require("telescope.actions").move_selection_next,
				["<C-k>"] = require("telescope.actions").move_selection_previous,
				["<C-d>"] = require("telescope.actions").move_selection_previous,
			},
		},
	},
})

-- Load the extensions
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "file_browser")

-- Define a custom function for the file browser
local function telescope_file_browser()
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
		previewer = false,
		initial_mode = "normal",
		layout_config = { height = 40 },
	})
end

-- Setup key mappings
vim.keymap.set("n", "<leader>/", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		previewer = true,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>fw", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>bb", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>sS", require("telescope.builtin").git_status, { desc = "[S]tatus of [G]it" })
vim.keymap.set(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "Telescope find all files" }
)

-- Add the custom file browser mapping
vim.keymap.set(
	"n",
	"<leader>sf",
	telescope_file_browser,
	{ desc = "Open File Browser with the path of the current buffer" }
)

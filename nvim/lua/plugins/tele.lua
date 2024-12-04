local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

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
				mappings = {
					i = {
						["<C-c>"] = function(prompt_bufnr) -- Create new file
							local cwd = vim.fn.getcwd()
							vim.fn.inputsave()
							local new_file = vim.fn.input("Create new file: ", cwd .. "/")
							vim.fn.inputrestore()

							if new_file ~= "" then
								vim.cmd("edit " .. new_file)
							end
						end,
						["<C-r>"] = function(prompt_bufnr) -- Rename selected file
							local current_picker = action_state.get_current_picker(prompt_bufnr)
							local selection = action_state.get_selected_entry()
							if selection then
								local old_file = selection.path
								vim.fn.inputsave()
								local new_file = vim.fn.input("Rename to: ", old_file)
								vim.fn.inputrestore()

								if new_file ~= "" and new_file ~= old_file then
									vim.fn.rename(old_file, new_file)
								end
							end
						end,
						["<C-d>"] = function(prompt_bufnr) -- Delete selected file
							local current_picker = action_state.get_current_picker(prompt_bufnr)
							local selection = action_state.get_selected_entry()
							if selection then
								local file_to_delete = selection.path
								vim.fn.delete(file_to_delete)
								actions.close(prompt_bufnr)
							end
						end,
					},
				},
			},
		},
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-d>"] = actions.move_selection_previous,
			},
		},
	},
})

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "file_browser")

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
		previewer = true,
		initial_mode = "normal",
		layout_config = { height = 50, width = 100 },
	})
end

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

vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#D3D3D3", fg = "#000000" })

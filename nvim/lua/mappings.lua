require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit Vim" })
map("i", "jj", "<Esc>", { noremap = false })
map("n", "zm", ":ZenMode<enter>", { noremap = false, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

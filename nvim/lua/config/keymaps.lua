vim.api.nvim_set_keymap("n", "qq", ":q<enter>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "ww", ":w<enter>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "qw", ":w<enter>:q<enter>", { noremap = false, silent = true })
vim.keymap.set("i", "jj", "<Esc>", { noremap = false })
vim.keymap.set("n", "zm", ":ZenMode<enter>", { noremap = false, silent = true })
vim.keymap.set("i", "zm", "<Esc>:ZenMode<enter>", { noremap = false, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.api.nvim_set_keymap("n", "cc", ":nohlsearch<enter>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>nn", ":Noice dismiss<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-g>", ":LazyGit<CR>", { noremap = true })

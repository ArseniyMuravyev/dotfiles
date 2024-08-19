vim.o.hlsearch = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.wo.number = true
vim.o.relativenumber = true

vim.o.mouse = ""

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

vim.cmd([[colorscheme catppuccin]])

vim.opt.clipboard = "unnamedplus"

vim.o.completeopt = "menuone,noselect"

vim.o.conceallevel = 2

vim.opt.fillchars = { eob = " " }

vim.opt.wrap = true

vim.o.swapfile = false

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.langmap =
	"ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

vim.g.mapleader = " "
vim.g.maplocalleader = " "
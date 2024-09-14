vim.o.hlsearch = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.swapfile = false

vim.o.mouse = ""

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.spelllang = "en_us,ru"
vim.opt.spell = true

vim.cmd([[colorscheme kanagawa]])
vim.cmd("hi BufferTabpageFill guibg=transparent")

vim.o.conceallevel = 2

vim.opt.fillchars = { eob = " " }

vim.opt.shortmess:append("sI")
vim.opt.whichwrap:append("<>[]hl")

vim.opt.laststatus = 0

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.clipboard = "unnamedplus"

vim.o.completeopt = "menuone,noselect"

vim.opt.langmap =
	"ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

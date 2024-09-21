vim.o.hlsearch = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.swapfile = false

vim.o.mouse = ""

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.backup = false

vim.opt.spelllang = "en_us,ru"
vim.opt.spell = true

vim.cmd([[colorscheme solarized-osaka]])

vim.cmd("hi BufferTabpageFill guibg=transparent")

vim.o.conceallevel = 2

vim.opt.fillchars = { eob = " " }

vim.opt.shortmess:append("sI")
vim.opt.whichwrap:append("<>[]hl")

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.opt.formatoptions:append({ "r" })

vim.opt.laststatus = 0

vim.opt.clipboard = "unnamedplus"

vim.o.completeopt = "menuone,noselect"

vim.opt.langmap =
	"ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

vim.cmd("hi @comment gui=italic")
vim.cmd("hi @keyword gui=italic")
vim.cmd("hi @constant gui=italic")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = " "

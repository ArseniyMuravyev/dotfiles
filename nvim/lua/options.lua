require "nvchad.options"

local o = vim.o
o.wrap = true
o.linebreak = true
o.breakindent = true
o.swapfile = false
o.mouse = ""
o.updatetime = 250
o.conceallevel = 2
vim.wo.relativenumber = true
vim.opt.langmap =
  "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

vim.api.nvim_create_user_command("ZenMode", function()
  require("zen-mode").toggle()
end, {})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require "nvchad.options"

local o = vim.o

o.wrap = true
o.linebreak = true
o.colorcolumn = "80"
o.breakindent = true
o.breakindentopt = "shift:2"
o.cursorlineopt = "both"
o.swapfile = false

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
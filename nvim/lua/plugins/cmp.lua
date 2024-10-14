local cmp = require("cmp")
local luasnip = require("luasnip")

-- Icons for LSP kinds
local kind_icons = {
	Text = "",
	Method = "ƒ",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "󰈔",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "󰯲",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "󰛦",
}

-- Border function
local function border(hl_name)
	return {
		{ "╭", hl_name },
		{ "─", hl_name },
		{ "╮", hl_name },
		{ "│", hl_name },
		{ "╯", hl_name },
		{ "─", hl_name },
		{ "╰", hl_name },
		{ "│", hl_name },
	}
end

-- Cmp options
local options = {
	completion = {
		completeopt = "menu,menuone,noinsert",
	},

	window = {
		completion = {
			border = border("CmpBorder"),
			winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:None",
			side_padding = 1,
		},
		documentation = {
			border = border("CmpDocBorder"),
			winhighlight = "NormalFloat:Pmenu,FloatBorder:Pmenu",
		},
	},

	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = function(entry, item)
			item.kind = string.format("%s %s", kind_icons[item.kind] or "", item.kind)
			return item
		end,
	},

	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),

	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},

	experimental = {
		ghost_text = true,
	},
}

-- Setup cmp
cmp.setup(options)

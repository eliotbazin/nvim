-- Status checks --
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	vim.notify("Could not find cmp")
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	vim.notify("Could not find luasnip")
	return
end

local copilot_status_ok, copilot = pcall(require, "copilot")
if not copilot_status_ok then
	vim.notify("Could not find Copilot")
	return
end

local copilot_cmp_status_ok, copilot_cmp = pcall(require, "copilot_cmp")
if not copilot_cmp_status_ok then
	vim.notify("Could not find copilot-cmp")
	return
end

-- Setup copilot --
copilot.setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
	-- filetypes = {}, -- Filestypes to disable copilot on
})
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { link = "CmpItemKindText" }) -- Make copilot symbol the same color as other symbol
copilot_cmp.setup() -- Allow copilot to be used in cmp

-- Helper function --
local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

-- Icons to show kind of completion
local kind_icons = {
	Text = "󰊄",
	Method = "m",
	Function = "󰊕",
	Constructor = "",
	Field = "",
	Variable = "󰫧",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "󰌆",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "󰉺",
	Copilot = "",
}
-- Icons fron: https://www.nerdfonts.com/cheat-sheet

-- Setup cmp
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- Add snippets engine
		end,
	},
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.

		-- Accept currently selected item. If none selected, select first item.
		["<cr>"] = cmp.mapping.confirm({ select = false }), -- Only confirm explicitly selected items.
		["<tab>"] = cmp.mapping(function(fallback)
      if check_backspace() then
          fallback()
      elseif cmp.visible() then
				cmp.select_next_item()
			--   elseif require("copilot.suggestion").is_visible() then
			-- require("copilot.suggestion").accept()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<s-tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			vim_item.menu = ({
				copilot = "[Copilot]",
				luasnip = "[Snippet]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[LUA]",
				vimtex = "[Tex]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{ name = "copilot", priority = 10 },
		{ name = "luasnip", priority = 11 },
		{ name = "nvim_lsp", priority = 8 },
		{ name = "nvim_lua", priority = 8 },
		{ name = "vimtex", priority = 11 },
		{ name = "buffer", priority = 6 },
		{ name = "path", priority = 6 },
	},
	sorting = {
		priority_weight = 1.0,
		comparators = {
			require("copilot_cmp.comparators").prioritize,
			cmp.config.compare.exact,
			cmp.config.compare.locality,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			cmp.config.compare.offset,
			cmp.config.compare.order,
		},
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
})
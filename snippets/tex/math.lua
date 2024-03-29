local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local c = ls.choice_node

local tex = require("snippets.tex.utils.conditions")

local line_begin = require("luasnip.extras.conditions.expand").line_begin

return {
	-- MATH --
	s({
		trig = "mm",
		name = "inline math",
		dscr = "Inline math mode $...$.",
		snippetType = "autosnippet",
	}, fmta("$<>$<>", { i(1), i(0) }), { condition = tex.not_in_math, show_condition = tex.not_in_math }),
	s(
		{
			trig = "dm",
			name = "display math",
			dscr = "Display math mode \\[...\\].",
			snippetType = "autosnippet",
		},
		fmta(
			[[
        \[
          <>
        .\]<>
      ]],
			{ i(1), i(0) }
		),
		{ condition = line_begin * tex.not_in_math, show_condition = line_begin * tex.not_in_math }
	),
	-- FRACTION --
	s({
		trig = "//",
		name = "fraction",
		dscr = "Generic fraction.",
		snippetType = "autosnippet",
	}, fmta([[\frac{<>}{<>}<>]], { i(1), i(2), i(0) }), { condition = tex.in_math, show_condition = tex.in_math }),
	s( -- TODO: Fix this
		{
			trig = "((?:\\w+)|(\\(.*\\))|(?:\\\\[A-Za-z]+))\\/",
			name = "auto fraction",
			dscr = "Automatically expands to a fraction.",
			snippetType = "autosnippet",
			trigEngine = "vim",
		},
		fmta([[\frac{<>}{<>}<>]], { f(function(_, snip)
			return snip.captures[1]
		end), i(1), i(0) }),
		{ condition = tex.in_math, show_condition = tex.in_math }
	),
}

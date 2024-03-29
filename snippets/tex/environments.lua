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
	-- ENVIRONMENTS --
	s(
		{
			trig = "beg",
			dscr = "Generic LaTeX \\begin{}...\\end{} environment.",
			name = "begin/end",
		},
		fmta(
			[[
        \begin{<>}
          <>
        \end{<>}
      ]],
			{ i(1), i(2), rep(1) }
		),
		{ condition = tex.in_text, show_condition = tex.in_text }
	),
	s(
		{
			trig = "eq",
			dscr = "amsmath align* equation environment. Use & as align character.",
			name = "equation",
		},
		fmta(
			[[
        \begin{align*}
          <>
        \end{align*}
      ]],
			{
				i(1),
			}
		),
		{ condition = tex.in_text, show_condition = tex.in_text }
	),

	-- ENUMERATE --
	s(
		{
			trig = "enum",
			dscr = "numbered list (enumerate)",
			name = "enumerate",
		},
		fmta(
			[[
        \begin{enumerate}<>
        \item <>
        \end{enumerate}
      ]],
			{
				c(1, {
					t(""),
					sn(
						nil,
						fmta(
							[[
            [label=<>]
          ]],
							{ c(1, { t("(\\alph*)"), t("(\\roman*)"), i(1) }) }
						)
					),
				}),
				c(2, {
					i(0),
					sn(
						nil,
						fmta(
							[[
            [<>] <>
          ]],
							{ i(1), i(0) }
						)
					),
				}),
			}
		),
		{ condition = tex.in_text, show_condition = tex.in_text }
	),

	-- BULLETPOINT --
	s({
		trig = "--",
		dscr = "generate bullet point in itemize and enumerate environment.",
		name = "bulletpoint",
		snippet_type = "autosnippet",
		hidden = true,
	}, { t("\\item") }, { condition = tex.in_bullets * line_begin, show_condition = tex.in_bullets() * line_begin }),
}

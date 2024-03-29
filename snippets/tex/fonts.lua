local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta

return {
	-- TYPEWRITER i.e. \texttt
	s(
		{
			trig = "([^%a])tt",
			desc = "Expands 'tt' into a \\text{} command from the amsmath package.",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
		},
		fmta("<>\\text{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
		})
	),
	-- ITALIC i.e. \textit
	s(
		{
			trig = "([^%a])tii",
			desc = "Expands 'tii' into a LaTeX \\textit{} command.",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
		},
		fmta("<>\\textit{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
		})
	),
	-- BOLD i.e. \textbf
	s(
		{
			trig = "([^%a])tbb",
			desc = "Expands 'tbb' into a LaTeX \\textbf{} command.",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
		},
		fmta("<>\\textbf{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
		})
	),
}

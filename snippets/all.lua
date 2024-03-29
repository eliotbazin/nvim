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

return {
	s({
		trig = "hi", -- trigger for the snippet. Either a string or a table of strings
		dscr = "An snippet that expands 'hi' into 'Hello, world!'",
		regTrig = false, -- whether the trigger should be treated as a regex pattern
		wordTrig = true, -- Prevents the snippet from being triggered in the middle of a word
		priority = 100, -- snippet priority
		snippetType = "snippet", -- "autosnippet" | "snippet"
	}, {
		t("Hello, World!"),
	}),
}

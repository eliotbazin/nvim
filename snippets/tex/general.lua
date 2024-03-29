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

return {
	-- REFERENCES --
	s({
		trig = "([^%a])hr",
		dscr = "The hyperref package's href{}{} command (for url links)",
		name = "hyperref",
		regTrig = true,
	}, fmta("\\href{<>}{<>}", { i(1, "url"), i(2, "display name") })),
}

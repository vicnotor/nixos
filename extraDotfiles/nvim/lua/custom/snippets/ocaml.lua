require("luasnip.session.snippet_collection").clear_snippets("ocaml")

local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("ocaml", {
	s("co", fmt("(* {} *){}", { i(1), i(0) })),
	s("ma", fmt("match {} with\n| {}", { i(1), i(0) })),
	s("match", fmt("match {} with\n| {}", { i(1), i(0) })),
	s("fun", fmt("function\n\t| {}", { i(0) })),
})

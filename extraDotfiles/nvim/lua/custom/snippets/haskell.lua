require("luasnip.session.snippet_collection").clear_snippets("haskell")

local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("haskell", {
	s("{", fmt("{{-\n  {}\n-}}{}", { i(1), i(0) })),
	s("--", fmt("--{}\n{}", { i(1), i(0) })),
})

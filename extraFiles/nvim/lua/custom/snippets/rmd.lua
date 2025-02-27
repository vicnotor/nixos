require("luasnip.session.snippet_collection").clear_snippets("rmd")

local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("rmd", {
	s("cb", fmt("```{{r}}{}\n```{}", { i(1), i(0) })),
	s("cbi", fmt("```\n{}\n```{{r}}{}", { i(1), i(0) })),
	s("h1", fmt("# {}\n{}", { i(1), i(0) })),
	s("h2", fmt("## {}\n{}", { i(1), i(0) })),
	s("h3", fmt("### {}\n{}", { i(1), i(0) })),
	s("h4", fmt("#### {}\n{}", { i(1), i(0) })),
	s("h5", fmt("##### {}\n{}", { i(1), i(0) })),
})

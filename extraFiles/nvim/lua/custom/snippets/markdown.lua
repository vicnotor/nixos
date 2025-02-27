require("luasnip.session.snippet_collection").clear_snippets("markdown")

local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("markdown", {
	s("cb", fmt("```{}\n```{}", { i(1), i(0) })),
	s("ha", fmt("```haskell\n{}\n```{}", { i(1), i(0) })),
	s("oc", fmt("```ocaml\n{}\n```{}", { i(1), i(0) })),
	s("R", fmt("```R\n{}\n```{}", { i(1), i(0) })),
	s("py", fmt("```python\n{}\n```{}", { i(1), i(0) })),
	s("h1", fmt("# {}\n{}", { i(1), i(0) })),
	s("h2", fmt("## {}\n{}", { i(1), i(0) })),
	s("h3", fmt("### {}\n{}", { i(1), i(0) })),
	s("h4", fmt("#### {}\n{}", { i(1), i(0) })),
	s("h5", fmt("##### {}\n{}", { i(1), i(0) })),
})


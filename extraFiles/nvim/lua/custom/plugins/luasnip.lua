return {
  {
    "saadparwaiz1/cmp_luasnip",
    config = function()
      local ls = require("luasnip")

      ls.config.set_config({
        history = false,
        updateevents = "TextChanged,TextChangedI",
      })

      vim.keymap.set({ "i", "s" }, "<c-k>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<c-j>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true })

      -- snippets
      local current_snips = require("luasnip.session.snippet_collection")
      local s = ls.snippet
      local i = ls.insert_node
      local fmt = require("luasnip.extras.fmt").fmt

      -- Haskell
      current_snips.clear_snippets("haskell")
      ls.add_snippets("haskell", {
        s("co", fmt("-- {}\n{}", { i(1), i(0) })),
        s("{", fmt("{{-\n  {}\n-}}{}", { i(1), i(0) })),
      })

      -- HTML
      current_snips.clear_snippets("html")
      ls.add_snippets("html", {
        s("co", fmt("<!-- {} -->{}", { i(1), i(0) })),
      })

      -- Markdown
      current_snips.clear_snippets("markdown")
      ls.add_snippets("markdown", {
        s("cb", fmt("```{}\n```{}", { i(1), i(0) })),
        s("ha", fmt("```haskell\n{}\n```{}", { i(1), i(0) })),
        s("oc", fmt("```ocaml\n{}\n```{}", { i(1), i(0) })),
        s("R", fmt("```R\n{}\n```{}", { i(1), i(0) })),
        s("py", fmt("```python\n{}\n```{}", { i(1), i(0) })),
        s("h1", fmt("# {}", { i(0) })),
        s("h2", fmt("## {}", { i(0) })),
        s("h3", fmt("### {}", { i(0) })),
        s("h4", fmt("#### {}", { i(0) })),
        s("h5", fmt("##### {}", { i(0) })),
      })

      -- OCaml
      current_snips.clear_snippets("ocaml")
      ls.add_snippets("ocaml", {
        s("co", fmt("(* {} *){}", { i(1), i(0) })),
        s("ma", fmt("match {} with\n| {}", { i(1), i(0) })),
        s("match", fmt("match {} with\n| {}", { i(1), i(0) })),
        s("fun", fmt("function\n\t| {}", { i(0) })),
      })

      -- RMarkdown
      current_snips.clear_snippets("rmd")
      ls.add_snippets("rmd", {
        s("cb", fmt("```{{r}}{}\n```{}", { i(1), i(0) })),
        s("cbi", fmt("```\n{}\n```{{r}}{}", { i(1), i(0) })),
        s("h1", fmt("# {}", { i(0) })),
        s("h2", fmt("## {}", { i(0) })),
        s("h3", fmt("### {}", { i(0) })),
        s("h4", fmt("#### {}", { i(0) })),
        s("h5", fmt("##### {}", { i(0) })),
      })
    end,
  }
}

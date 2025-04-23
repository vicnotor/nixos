return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.mdformat.with({
          extra_args = {
            "--number",
            "--wrap", "80",
          },
        }),
        null_ls.builtins.formatting.ocamlformat.with({
          extra_args = {
            "--if-then-else", "fit-or-vertical",
            "--break-cases", "toplevel",
            "--extension-indent", "2",
            "--function-indent", "2",
            "--let-binding-indent", "2",
            "--type-decl-indent", "2",
            "--exp-grouping", "preserve",
            "--cases-exp-indent", "2",
          },
        })
      },
    })
  end,
}

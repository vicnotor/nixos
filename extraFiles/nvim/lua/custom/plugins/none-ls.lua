return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    local latexindent = {
      method = null_ls.methods.FORMATTING,
      filetypes = { "tex" },
      generator = null_ls.formatter({
        command = "latexindent",
        args = {
          "-m",
          '-y="modifyLineBreaks:textWrapOptions:columns:76"',
          '$FILENAME'
        },
        to_stdin = true,
        from_stderr = true,
      }),
    }

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.mdformat.with({
          extra_args = {
            "--number",
            "--wrap", "76",
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
        }),
        null_ls.builtins.formatting.bibclean,
        null_ls.register(latexindent)
      },
    })
  end,
}

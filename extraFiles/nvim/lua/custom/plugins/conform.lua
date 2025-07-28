return {
  {
    'stevearc/conform.nvim',
    config = function()
      require("conform").setup({
        default_format_opts = {
          lsp_format = "fallback",
          async = true,
        },
        formatters = {
          latexindent = {
            prepend_args = {
              '-y=modifyLineBreaks:textWrapOptions:columns:75',
              "-m",
            },
          },
          mdformat = {
            prepend_args = {
              "--number",
              "--wrap", "75",
            }
          },
          ocamlformat = {
            prepend_args = {
              "--if-then-else", "fit-or-vertical",
              "--break-cases", "toplevel",
              "--extension-indent", "2",
              "--function-indent", "2",
              "--let-binding-indent", "2",
              "--type-decl-indent", "2",
              "--exp-grouping", "preserve",
              "--cases-exp-indent", "2",
            }
          },
        },
        formatters_by_ft = {
          tex      = { "latexindent" },
          markdown = { "mdformat" },
          ocaml    = { "ocamlformat" },
          qml      = { "qmlformat" },
        },
      })
    end,
  }
}

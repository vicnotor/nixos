return {
  {
    'stevearc/conform.nvim',
    config = function()
      require("conform").setup({
        default_format_opts = {
          lsp_format = "fallback",
          timeout_ms = 10000,
        },
        formatters = {
          latexindent = {
            prepend_args = {
              '-y=modifyLineBreaks:textWrapOptions:columns:76',
              "-m",
            },
          },
          mdformat = {
            prepend_args = {
              "--number",
              "--wrap", "76",
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
          markdown = { "mdformat", },
          ocaml    = { "ocamlformat", },
        },
      })
    end,
  }
}

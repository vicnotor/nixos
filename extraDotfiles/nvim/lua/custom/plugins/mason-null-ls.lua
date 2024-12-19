return {
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			local null_ls = require("null-ls")

			require("mason-null-ls").setup({
				ensure_installed = {
          "stylua",
          "mdformat"
        },
				-- Will automatically install masons tools based on selected sources in `null-ls`.
				-- Example: `automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }`
				automatic_installation = false,
				-- Sources found installed in mason will automatically be set up for null-ls.
				automatic_setup = true,
				handlers = {
					-- Hint: see https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
					-- Hint: see https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
					ocamlformat = function(source_name, methods)
						null_ls.register(null_ls.builtins.formatting.ocamlformat.with({
							-- Add more arguments to a source's defaults
							-- Default: { "--enable-outside-detected-project", "--name", "$FILENAME", "-" }
							-- Type `ocamlformat --help` in your terminal to check more args
							extra_args = {
								"--if-then-else",
								"fit-or-vertical",
								"--break-cases",
								"toplevel",
								"--extension-indent",
								"2",
								"--function-indent",
								"2",
								"--let-binding-indent",
								"2",
								"--type-decl-indent",
								"2",
								"--exp-grouping",
								"preserve",
								"--cases-exp-indent",
								"2",
							},
						}))
					end,
				},
			})

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.gdformat,
          null_ls.builtins.formatting.alejandra,
				},
			})
		end,
	},
}

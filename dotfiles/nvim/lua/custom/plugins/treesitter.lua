return {
	{
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			-- See `:help nvim-treesitter`
			-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
			vim.defer_fn(function()
				require("nvim-treesitter.configs").setup({
					-- Add languages to be installed here that you want installed for treesitter
					ensure_installed = {
						"c",
						"cpp",
						"go",
						"lua",
						"python",
						"rust",
						"javascript",
						"typescript",
						"vimdoc",
						"vim",
						"bash",
						"r",
						"markdown",
						"rnoweb",
						"yaml",
					},

					-- Install parsers synchronously (only applied to `ensure_installed`)
					sync_install = false,

					-- Autoinstall languages that are not installed. Defaults to false.
					auto_install = true,

					highlight = {
						enable = true,

						-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
						additional_vim_regex_highlighting = false,
					},
					indent = { enable = true, disable = { "ocaml" } },
				})
			end, 0)
		end,
	},
}

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/neodev.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{
				"j-hui/fidget.nvim",
				opts = {
					notification = {
						window = {
							winblend = 0, -- Background color opacity in the notification window
						},
					},
				},
			},

			-- Autoformatting
			"stevearc/conform.nvim",
		},
		config = function()
			--  This function gets run when an LSP connects to a particular buffer.
			local on_attach = function(_, bufnr)
				-- We create a function that lets us more easily define mappings specific
				-- for LSP related items. It sets the mode, buffer and description for us each time.

				local lspmap = function(keys, func, desc)
					if desc then
						desc = "LSP: " .. desc
					end

					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end

				local builtin = require("telescope.builtin")

				lspmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				lspmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				lspmap("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
				lspmap("gr", builtin.lsp_references, "[G]oto [R]eferences")
				lspmap("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")
				lspmap("<leader>D", builtin.lsp_type_definitions, "Type [D]efinition")
				lspmap("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
				lspmap("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

				-- See `:help K` for why this keymap
				lspmap("K", vim.lsp.buf.hover, "Hover Documentation")
				lspmap("<C-s>", vim.lsp.buf.signature_help, "Signature Documentation")

				-- Lesser used LSP functionality
				lspmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				lspmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
				lspmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
				lspmap("<leader>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, "[W]orkspace [L]ist Folders")

				-- Create a command `:Format` local to the LSP buffer
				vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
					vim.lsp.buf.format()
				end, { desc = "Format current buffer with LSP" })
			end

			-- document existing key chains
			require("which-key").add({
				{ "<leader>wr", group = "[R]ename" },
				{ "<leader>wr_", hidden = true },
				{ "<leader>ws", group = "[S]earch" },
				{ "<leader>ws_", hidden = true },
				{ "<leader>", group = "VISUAL <leader>", mode = "v" },
			})
			-- mason-lspconfig requires that these setup functions are called in this order
			-- before setting up the servers.
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
			require("mason-lspconfig").setup()

			-- Enable the following language servers
			--  Add any additional override configuration in the following tables. They will be passed to
			--  the `settings` field of the server config. You must look up that documentation yourself.
			--
			--  If you want to override the default filetypes that your language server will attach to you can
			--  define the property 'filetypes' to the map in question.
			local servers = {
				clangd = {},
				pyright = {
					analysis = {
						diagnosticSeverityOverrides = {
							reportUnusedVariable = false,
						},
					},
				},
				ts_ls = {},
				html = { filetypes = { "html", "twig", "hbs" } },
				lua_ls = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
						-- Ignore Lua_LS's noisy `missing-fields` warnings
						diagnostics = { disable = { "missing-fields" } },
					},
				},
				marksman = {},
				bashls = {},
				zls = {},
			}

			-- Setup neovim lua configuration
			require("neodev").setup()

			-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			-- Ensure the servers above are installed
			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(servers),
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
						settings = servers[server_name],
						filetypes = (servers[server_name] or {}).filetypes,
					})
				end,
			})

			-- Autoformatting Setup
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					markdown = { "mdformat" },
				},
			})

			-- Manual installed LSP's (i.e. without Mason)

			-- Godot setup
			local lspconfig = require("lspconfig")
			lspconfig["gdscript"].setup({
				name = "godot",
				cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
			})
			lspconfig.nixd.setup({
				cmd = { "nixd" },
				settings = {
					nixd = {
						nixpkgs = {
							expr = "import <nixpkgs> { }",
						},
						formatting = {
							command = { "alejandra" },
						},
						-- options = {
						-- 	nixos = {
						-- 		expr = '(builtins.getFlake "/home/vic/Git/xxheyhey/nixos-xx").nixosConfigurations.nixlap.options',
						-- 	},
						-- 	home_manager = {
						-- 		expr = '(builtins.getFlake "/home/vic/Git/xxheyhey/nixos-xx").homeConfigurations."nixlap@vic".options',
						-- 	},
						-- },
					},
				},
			})
			lspconfig.hls.setup({
				filetypes = { "haskell", "lhaskell", "cabal" },
				settings = {
					hls = {
						haskell = {
							plugin = {
								rename = { config = { crossModule = true } },
							},
						},
					},
				},
			})
			lspconfig.ocamllsp.setup({})
		end,
	},
}

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Enable again if removing noice.nvim
      -- {
      -- 	"j-hui/fidget.nvim",
      -- 	opts = {
      -- 		notification = {
      -- 			window = {
      -- 				winblend = 0, -- Background color opacity in the notification window
      -- 			},
      -- 		},
      -- 	},
      -- },
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      { -- optional cmp completion source for require statements and module annotations
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
          opts.sources = opts.sources or {}
          table.insert(opts.sources, {
            name = "lazydev",
            group_index = 0, -- set group index to 0 to skip loading LuaLS completions
          })
        end,
      },
    },
    config = function()
      --  This function gets run when an LSP connects to a particular buffer.
      local on_attach = function(bufnr)
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
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          on_attach(args.buf)
        end,
      })

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      -- enabling LSPs
      vim.lsp.enable("bashls")
      vim.lsp.enable("clangd")
      vim.lsp.enable("gdscript")
      vim.lsp.enable("hls")
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("ltex_plus")
      vim.lsp.enable("nixd")
      vim.lsp.enable("ocamllsp")
      vim.lsp.enable("pyright")
      vim.lsp.enable("qmlls")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("zls")

      -- Additional setup
      vim.lsp.config("gdscript", {
        name = "godot",
        cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
      }
      )
      vim.lsp.config("hls", {
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
      vim.lsp.config("lua_ls", {
        settings = {
          lua_ls = {
            Lua = {
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
              -- Ignore Lua_LS's noisy `missing-fields` warnings
              diagnostics = { disable = { "missing-fields" } },
            },
          },
        },
      })
      vim.lsp.config("ltex_plus", {
        filetypes = { "tex", },
        settings = {
          ltex = {
            language = "en-GB",
            checkFrequency = "save",
          },
        },
      })
      vim.lsp.config("nixd", {
        cmd = { "nixd" },
        settings = {
          nixd = {
            nixpkgs = {
              expr = "import <nixpkgs> { }",
            },
            formatting = {
              command = { "alejandra" },
            },
            options = {
              nixos = {
                expr = '(builtins.getFlake "/home/vic/Git/vicnotor/nixos").nixosConfigurations.nixlap.options',
              },
            },
          },
        },
      })
    end,
  },
}

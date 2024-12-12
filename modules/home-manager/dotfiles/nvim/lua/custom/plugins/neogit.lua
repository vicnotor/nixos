return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = function()
			require("neogit").setup({
				vim.keymap.set("n", "<leader>gs", function()
					require("neogit").open({ kind = "split" })
				end, { desc = "Git" }),
				vim.keymap.set("n", "<leader>gc", function()
					require("neogit").open({ "commit", kind = "split" })
				end, { desc = "Git commit" }),
				vim.keymap.set("n", "<leader>gP", function()
					require("neogit").open({ "push", kind = "split" })
				end, { desc = "Git push" }),
				vim.keymap.set("n", "<leader>gp", function()
					require("neogit").open({ "pull", "--rebase", kind = "split" })
				end, { desc = "Git push" }),
			})
		end,
	},
}

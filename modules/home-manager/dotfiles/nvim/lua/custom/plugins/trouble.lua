return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>tt",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Toggle Trouble",
			},
			{
				"[t",
				"<cmd>Trouble diagnostics prev jump=true<cr>",
				desc = "Trouble Previous",
			},
			{
				"]t",
				"<cmd>Trouble diagnostics next jump=true<cr>",
				desc = "Trouble Next",
			},
			{
				"<leader>ts",
				"<cmd>Trouble symbols toggle focus=false pinned=true results.win.relative=win results.win.position=right<cr>",
				desc = "Toggle symbols (Trouble)",
			},
		},
	},
}

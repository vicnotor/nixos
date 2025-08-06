return {
	{
		"vim-tmux-navigator-custom",
		dir = "~/.config/nvim/custom-plugins/vim-tmux-navigator-custom",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
		},
		keys = {
			{ "<F1>", "<cmd>TmuxNavigateLeft<cr>" },
			{ "<F2>", "<cmd>TmuxNavigateDown<cr>" },
			{ "<F3>", "<cmd>TmuxNavigateUp<cr>" },
			{ "<F4>", "<cmd>TmuxNavigateRight<cr>" },
		},
	},
}

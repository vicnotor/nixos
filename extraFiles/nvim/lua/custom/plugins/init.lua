-- Plugins without extensive setup are added here
return {
	-- The most important dependency
	"nvim-lua/plenary.nvim",

	-- Other
	"ThePrimeagen/vim-be-good",
	"mbbill/undotree",

	-- Useful plugin to show you pending keybinds.
	{ "nvim-treesitter/nvim-treesitter-context", opts = { max_lines = 3 } },

	{ "folke/persistence.nvim", event = "BufReadPre", opts = {} },
	{ "folke/zen-mode.nvim", opts = { window = { width = 1.0 }, plugins = { tmux = { enabled = true } } } },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"nvim-pack/nvim-spectre",
		opts = {
			default = {
				find = {
					cmd = "rg",
					options = { "hidden" },
				},
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			keywords = {
				REMOVE = { icon = " ", color = "error", alt = { "REMOVE" } },
			},
		},
	},
	-- "gc" to comment visual regions/lines
	{ "echasnovski/mini.icons", version = false, opts = {} },
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			vim.opt.termguicolors = true
			require("colorizer").setup({
				"*",
				css = { rgb_fn = true },
			}, {
				names = false,
				RRGGBBAA = true,
			})
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
	},
	{
		"echasnovski/mini.surround",
		version = false,
		opts = {
			mappings = {
				add = "ma", -- Add surrounding in Normal and Visual modes
				delete = "md", -- Delete surrounding
				find = "mf", -- Find surrounding (to the right)
				find_left = "mF", -- Find surrounding (to the left)
				highlight = "mh", -- Highlight surrounding
				replace = "mr", -- Replace surrounding
				update_n_lines = "mn", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
		},
	},
	-- {
	-- 	"sphamba/smear-cursor.nvim",
	-- 	opts = {
	-- 		legacy_computing_symbols_support = true,
	-- 		stiffness = 0.8,
	-- 		trailing_stiffness = 0.5,
	-- 		distance_stop_animating = 0.5,
	-- 		hide_target_hack = false,
	-- 	},
	-- },
	-- {
	-- 	"huy-hng/anyline.nvim",
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter" },
	-- 	config = true,
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		context_highlight = "NvimIdentifierScope",
	-- 		fps = 60,
	-- 		length_acceleration = 0.04,
	-- 	},
	-- 	ft_ignore = {
	-- 		"markdown",
	--      "rmd",
	-- 	},
	-- },
}

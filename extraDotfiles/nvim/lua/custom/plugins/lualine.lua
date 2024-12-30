return {
	{
		-- Set lualine as statusline
		"nvim-lualine/lualine.nvim",
		-- See `:help lualine.txt`
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = {
						{
							"mode",
							icon = "",
							separator = { left = "", right = "" },
						},
					},
					lualine_b = {
						{
							"branch",
							icon = "",
							separator = { left = "", right = "" },
							color = {
								fg = "#1c1d21",
								bg = "#7d83ac",
							},
						},
						{
							"diff",
							separator = { left = "", right = "" },
							color = {
								fg = "#1c1d21",
								bg = "#7d83ac",
							},
						},
					},
					lualine_c = {
						{
							"diagnostics",
							separator = { left = "", right = "" },
							color = {
								bg = "#45475a",
							},
						},
						{ "filename", path = 4, },
					},
					lualine_x = { "progress", "filesize" },
					lualine_y = { { "filetype" } },
					lualine_z = { { "location", icon = "" } },
				},
			})
		end,
	},
}

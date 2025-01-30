-- theme customization
Mycolor = "tokyonight" -- Change this to switch themes

-- This function sets the theme the right way
function Color(color)
	color = color or Mycolor
	vim.cmd.colorscheme(color)

	-- Highlight groups
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#7d86ad" })
	vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#4d567d" })
	vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#4d567d" })
	vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#333033" })
	vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { fg = "#999099", bg = "#333033" })

  -- Needed for some themes as a Lualine bug fix
	-- vim.api.nvim_set_hl(0, "StatusLine", { reverse = false })
	-- vim.api.nvim_set_hl(0, "StatusLineNC", { reverse = false })

	-- The following is needed for some themes to fix the background
	-- of some windows or parts of the screen (for transparent mode)
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- Function to cycle between themes
function ToggleColorScheme()
	if Mycolor == "tokyonight" then
		Mycolor = "gruvbox"
  elseif Mycolor == "gruvbox" then
		Mycolor = "rose-pine"
	elseif Mycolor == "rose-pine" then
		Mycolor = "vague"
	else
		Mycolor = "gruvbox"
	end
	Color()
end

return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				underline = false,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
				inverse = false, -- might be needed to fix some color issues
				overrides = {
					["@function.call"] = { fg = "#d1832e", bold = false },
					["@variable"] = { fg = "#ebdbb2", bold = false },
					["@markup.italic"] = { italic = true },
				},
				dim_inactive = false,
				transparent_mode = true,
			})
		end,
	},
	{
		-- Copied from Coding with Sphere (youtube)
		"vague2k/vague.nvim",
		config = function()
			require("vague").setup({
				style = {
					comments = "none",
					strings = "none",
				},
				colors = {
					func = "#bc96b0",
					keyword = "#787bab",
					-- string = "#d4bd98",
					string = "#8a739a",
					-- string = "#f2e6ff",
					-- number = "#f2e6ff",
					-- string = "#d8d5b1",
					number = "#8f729e",
					-- type = "#dcaed7",
				},
			})
		end,
	},
	{
		-- Nice theme
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				dark_variant = "moon", -- main, moon, or dawn
				dim_inactive_windows = false,
				disable_background = true,
				styles = {
					transparency = true,
					italic = false,
				},
				highlight_groups = {
					-- Normal background color
					-- Normal = { bg = "#1f1d2e" }, -- Rosé pine normal "surface"
					-- NormalFloat = { bg = "#1f1d2e", fg = "#FFFFFF" }, -- Rosé pine normal "surface"
					-- Normal = { bg = "#191724" }, -- Rosé pine normal "base"
					-- NormalFloat = { bg = "#191724" }, -- Rosé pine normal "base"
					Pmenu = { bg = "#2f1d54" },
					["@markup.italic"] = { italic = true },
				},
			})
		end,
	},
	{
		-- Another one
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup({
				style = "night", -- The theme comes in four styles, `storm`, `moon`, a darker variant `night` and `day`
				transparent = true, -- Enable this to disable setting the background color
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = false },
					keywords = { italic = false },
					sidebars = "transparent", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
				dim_inactive = true,
				lualine_bold = true, -- Bold ection headers in lualine

				-- Custom colors
				---@param colors ColorScheme
				on_colors = function(colors)
					--colors.green = "#b4f56e"
					colors.comment = "#7d86ad"
				end,
			})
		end,
	},
}

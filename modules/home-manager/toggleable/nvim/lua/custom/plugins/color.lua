-- theme customization
Mycolor = "rose-pine" -- Change this to switch themes

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
  vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#1A1B26" })
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
    Mycolor = "tokyonight"
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
        inverse = false,
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
    "vague2k/vague.nvim",
    config = function()
      require("vague").setup({
        italic = false
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
        style = "night",    -- The theme comes in four styles, `storm`, `moon`, a darker variant `night` and `day`
        transparent = true, -- Enable this to disable setting the background color
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = false },
          keywords = { italic = false },
          sidebars = "transparent", -- style for sidebars, see below
          floats = "dark",          -- style for floating windows
        },
        dim_inactive = true,
        lualine_bold = true, -- Bold ection headers in lualine

        -- Custom colors
        on_colors = function(colors)
          --colors.green = "#b4f56e"
          colors.comment = "#7d86ad"
        end,
      })
    end,
  },
}

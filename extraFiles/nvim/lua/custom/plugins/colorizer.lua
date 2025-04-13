return {
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
}

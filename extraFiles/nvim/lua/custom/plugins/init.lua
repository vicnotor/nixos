-- Plugins without extensive setup are added here
return {
  "nvim-lua/plenary.nvim",
  "ThePrimeagen/vim-be-good",
  "mbbill/undotree",
  { "nvim-treesitter/nvim-treesitter-context", opts = { max_lines = 3 } },
  { "folke/zen-mode.nvim",                     opts = { window = { width = 1.0 }, plugins = { tmux = { enabled = true } } } },
  { "folke/persistence.nvim",                  event = "BufReadPre",                                                        opts = {} },
  { "echasnovski/mini.icons",                  version = false,                                                             opts = {} },
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
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
}

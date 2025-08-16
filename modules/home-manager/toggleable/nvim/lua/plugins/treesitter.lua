return {
  {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-context",
        opts = { max_lines = 3 }
      },
    },
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
      vim.defer_fn(function()
        require("nvim-treesitter.configs").setup({
          auto_install = true,
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
          indent = { enable = true, disable = { "ocaml" } },
        })
      end, 0)
    end,
  },
}

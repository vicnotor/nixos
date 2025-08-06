return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      keywords = {
        REMOVE = { icon = " ", color = "error", alt = { "REMOVE" } },
      },
    },
  },
}

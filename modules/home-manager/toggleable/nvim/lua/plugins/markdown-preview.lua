return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    config = function()
      vim.keymap.set("n", "<leader>mdl", function()
        vim.g.mkdp_theme = "light"
        vim.cmd("MarkdownPreview")
      end, { desc = "Markdown Preview light" })
      vim.keymap.set("n", "<leader>mdd", function()
        vim.g.mkdp_theme = "dark"
        vim.cmd("MarkdownPreview")
      end, { desc = "Markdown Preview dark" })
      -- vim.g.mkdp_preview_options = { disable_sync_scroll = 1 }
    end,
  }
}

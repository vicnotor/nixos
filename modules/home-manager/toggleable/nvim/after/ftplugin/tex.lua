vim.opt.textwidth = 75
-- Open the file explorer
vim.keymap.set("n", "vv", "<CMD>VimtexView<CR>", {
  desc   = "[V]imtex[V]iew",
  silent = true
})
vim.keymap.set("n", "<leader>vc", "<CMD>VimtexCountWords<CR>", {
  desc = "[V]imtex[C]ountWords",
  silent = true
})

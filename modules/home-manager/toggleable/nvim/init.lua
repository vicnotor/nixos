-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup("plugins")

Color() -- Run colorscheme function at startup

-- Strudel.nvim .str loading issues workaround
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.str",
  callback = function()
    vim.bo.filetype = "javascript"
    local strudel = require("strudel")
    vim.keymap.set("n", "<leader>ss", strudel.launch, { desc = "Launch Strudel" })
    vim.keymap.set("n", "<leader><leader>", strudel.toggle, { desc = "Strudel Toggle Play/Pause" })
    vim.keymap.set("n", "<localLeader>", strudel.toggle, { desc = "Strudel Toggle Play/Pause" })
  end,
})

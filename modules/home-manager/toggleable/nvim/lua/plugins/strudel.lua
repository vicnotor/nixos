return {
  {
    "vicnotor/strudel.nvim",
    branch = "test-branch",
    cmd = "StrudelLaunch",
    build = "npm install",
    config = function()
      local strudel = require("strudel")
      strudel.setup({
        browser_exec_path = "/etc/profiles/per-user/vic/bin/google-chrome-stable",
        update_on_save = true,
      })

      -- strudel.launch is set in plugin/keymaps.lua
      vim.keymap.set("n", "<leader>ss", strudel.launch, { desc = "Launch Strudel" })
      vim.keymap.set("n", "<leader><leader>", strudel.toggle, { desc = "Strudel Toggle Play/Pause" })
      vim.keymap.set("n", "<localLeader>", strudel.toggle, { desc = "Strudel Toggle Play/Pause" })
      vim.keymap.set("n", "<leader>sq", strudel.quit, { desc = "Quit Strudel" })
      vim.keymap.set("n", "<leader>sp", strudel.toggle, { desc = "Strudel Toggle Play/Pause" })
      vim.keymap.set("n", "<leader>su", strudel.update, { desc = "Strudel Update" })
      vim.keymap.set("n", "<leader>sb", strudel.set_buffer, { desc = "Strudel set current buffer" })
      vim.keymap.set("n", "<leader>sx", strudel.execute, { desc = "Strudel set current buffer and update" })
    end,
  }
}

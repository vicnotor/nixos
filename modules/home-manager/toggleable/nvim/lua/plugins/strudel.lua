return {
  {
    "vicnotor/strudel.nvim",
    branch = "feature-branch",
    cmd = "StrudelLaunch",
    build = "npm install",
    config = function()
      require("strudel").setup({
        browser_exe_path = "/etc/profiles/per-user/vic/bin/google-chrome-stable",
      })
    end,
  }
}

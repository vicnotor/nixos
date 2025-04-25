return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    image = { enabled = true },
    quickfile = { enabled = true },
    input = { enable = true },
    rename = { enable = true },
    animate = {
      enabled = true,
      fps = 165,
    },
    indent = {
      enabled = true,
      only_scope = true,
      animate = {
        duration = {
          step = 20,   -- ms per step
          total = 250, -- maximum duration
        },
      },
      chunk = {
        enabled = true,
        char = {
          corner_top = "╭",
          corner_bottom = "╰",
          horizontal = "─",
          vertical = "│",
          arrow = ">",
        },
      },
    },
    scroll = {
      enable = true,
      animate = {
        duration = { step = 5, total = 200 },
      },
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- LSP file renaming for Oil
        vim.api.nvim_create_autocmd("User", {
          pattern = "OilActionsPost",
          callback = function(event)
            if event.data.actions.type == "move" then
              Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
            end
          end,
        })
        -- LSP file renaming for mini.files
        vim.api.nvim_create_autocmd("User", {
          pattern = "MiniFilesActionRename",
          callback = function(event)
            Snacks.rename.on_rename_file(event.data.from, event.data.to)
          end,
        })

        vim.api.nvim_create_autocmd("FileType", {
          pattern = {"markdown", "tex"},
          callback = function(event)
            Snacks.indent.disable()
          end,
        })

        Snacks.toggle.animate():map("<leader>da")
        Snacks.toggle.indent():map("<leader>i")
      end,
    })
  end,
}

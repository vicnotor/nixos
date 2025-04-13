return {
  {
    "stevearc/oil.nvim",
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      require("oil").setup({
        -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
        -- Set to false if you still want to use netrw.
        default_file_explorer = true,
        -- Id is automatically added at the beginning, and name at the end
        -- See :help oil-columns
        columns = {
          "icon",
          -- "permissions",
          -- "size",
          -- "mtime",
        },
        -- Window-local options to use for oil buffers
        win_options = {
          signcolumn = "yes",
        },
        preview_win = {
          -- How to open the preview window "load"|"scratch"|"fast_scratch"
          preview_method = "load",
        },
        -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
        delete_to_trash = false,
        -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
        skip_confirm_for_simple_edits = true,
        -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
        -- (:help prompt_save_on_select_new_entry)
        prompt_save_on_select_new_entry = true,
        -- See :help oil-actions for a list of all available actions
        keymaps = {
          ["<C-h>"] = false,
          ["<C-l>"] = false,
          ["<leader>pi"] = function()
            local oil = require("oil")
            local filename = oil.get_cursor_entry().name
            local dir = oil.get_current_dir()
            oil.close()

            local img_clip = require("img-clip")
            img_clip.paste_image({}, dir .. filename)
          end,
        },
        view_options = {
          show_hidden = true,
        },
      })
    end,
  },
}

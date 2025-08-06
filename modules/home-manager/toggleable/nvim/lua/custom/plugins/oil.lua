return {
  {
    "stevearc/oil.nvim",
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      require("oil").setup({
        default_file_explorer = true,
        columns = {
          "icon",
          -- "permissions",
          -- "size",
          -- "mtime",
        },
        buf_options = {
          buflisted = true, -- Makes <C-o> and <C-i> work with oil buffers
        },
        win_options = {
          signcolumn = "yes",
        },
        preview_win = {
          preview_method = "load", --"load"|"scratch"|"fast_scratch"
        },
        skip_confirm_for_simple_edits = true,
        prompt_save_on_select_new_entry = true,
        keymaps = {
          ["<C-h>"] = false,
          ["<C-l>"] = false,
          ["gp"] = function()
            require("oil").open_preview()
          end,
          ["gd"] = {
            desc = "Toggle file detail view",
            callback = function()
              Detail = not Detail
              if Detail then
                require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
              else
                require("oil").set_columns({ "icon" })
              end
            end,
          },

          -- img-clip integration
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

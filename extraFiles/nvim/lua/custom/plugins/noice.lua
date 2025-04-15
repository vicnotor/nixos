return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        opts = {
          render = "minimal",
          stages = "slide_out",
          fps = 165,
          timeout = 2000,
          top_down = false,
        },
      },
    },
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true,   -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        inc_rename = false,     -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,  -- add a border to hover docs and signature help
      },
      views = {
        cmdline_popup = {
          position = {
            row = "95%",
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
      },
      routes = {
        {
          view = "mini",
          filter = { event = "msg_showmode", find = "/" }, -- Show recording messages, but not other modes like --INSERT--
        },
        {
          view = "mini",
          filter = {
            kind = "search_count",
          },
        },
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "yanked",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "fewer",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "more",
          },
          opts = { skip = true },
        },
        { -- Check once in a while if the bug is fixed where the written to file notification happens way too late
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
      },
    },
  }
}

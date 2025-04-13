return {
  {
    'echasnovski/mini.move',
    version = false,
    config = function()
      require('mini.move').setup({
        mappings = {
          -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
          down = "J",
          left = "H",
          right = "L",
          up = "K",

          -- Move current line in Normal mode
          line_left = "<Nop>",
          line_right = "<Nop>",
          line_down = "<Nop>",
          line_up = "<Nop>",
        },
      })
    end,
  },
}

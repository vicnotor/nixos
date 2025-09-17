-- See `:help set()`
local set = vim.keymap.set

set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
set({ "n", "v" }, "<CR>", "<Nop>", { silent = true })
set({ "n", "v", "i" }, "◆", "<C-i>", { silent = true })

-- Diagnostics
set("n", "[d", function()
  vim.diagnostic.jump({ count = 1 })
end, { desc = "Go to previous diagnostic message" })
set("n", "]d", function()
  vim.diagnostic.jump({ count = -1 })
end, { desc = "Go to next diagnostic message" })
set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

-- Open the file explorer
set("n", "<leader>th", "<CMD>silent !app2unit -- $FILE_PICKER .<CR>",
  { desc = "Open file [e][x]plorer in working directory", silent = true })

-- yank to clipboard
set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
set("n", "<leader>Y", [["+Y]], { desc = "Yank to clipboard" })
set("v", "<leader>Y", [["+y]], { desc = "Yank to clipboard" })

-- Make file executable
set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "'chmod + x' on current file", silent = true })

-- tmux-sessionizer
set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Launch tmux-sessionizer script" })

-- Format file
set("n", "<leader>f", function()
  require("conform").format()
end, { desc = "Format file" })

-- Format paragraph with gq
set("n", "<leader>F", "gwap", { desc = "Format paragraph with gq" })

-- Switch to next window
set("n", "<tab>", "<cmd>winc w<CR>", { desc = "Change focus to next vim window", silent = true })
set("n", "<C-tab>", "<cmd>winc w<CR>", { desc = "Change focus to next vim window", silent = true })

-- Toggle wrap
set("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "Toggle wrap", silent = true })

-- Toggle the color scheme
set("n", "<leader>co", function()
  ToggleColorScheme()
end, { desc = "Toggle theme", silent = true })

-- Toggle ZenMode
set("n", "<F11>", "<cmd>ZenMode<CR>", { desc = "Start ZenMode", silent = true })

-- Open current file in browser
set("n", "gX", "<cmd>silent !xdg-open % &<CR>", { desc = "Open current file in Chrome" })

-- nvim-spectre
set("n", "<leader>Sr", '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
set(
  "n",
  "<leader>Sw",
  '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
  { desc = "Search current word" }
)
set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', { desc = "Search current word" })
set(
  "n",
  "<leader>Sf",
  '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
  { desc = "Search on current file" }
)

-- Simpler search and replace than nvim-spectre:
set("n", "<leader>sr", ":%s/", { desc = "Search and replace" })
-- Search and replace current word
set(
  "n",
  "<leader>sw",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Change the current and all the same words" }
)

-- Search through all keymaps with Telescope
set("n", "<leader>key", "<cmd>Telescope keymaps<CR>", { desc = "Search through keymaps", silent = true })

set("n", "<F5>", "<CMD>e<CR>", { desc = "Reload buffer" })

-- mdto pdf
set("n", "<leader>mdp", function()
  local file = vim.fn.expand("%")
  local escaped_file = vim.fn.shellescape(file)
  vim.cmd("!mdto pdf " .. escaped_file)
end, { desc = "[M]ark[d]own to [p]df" })

-- mdto html
set("n", "<leader>mdh", function()
  local file = vim.fn.expand("%")
  local escaped_file = vim.fn.shellescape(file)
  vim.cmd("!mdto html" .. escaped_file)
end, { desc = "[M]ark[d]own to [h]tml" })

-- Dismiss Noice message
set("n", "<Del>", "<CMD>NoiceDismiss<CR>", { desc = "Dismiss Noice message" })

-- vsplit
set("n", "<leader>v", "<CMD>vsplit<CR>", { desc = "Create [v]ertical split" })

-- Other
set("n", "J", "mzJ`z")
set("i", "<C-c>", "<Esc>")
set("n", "Q", "<nop>")

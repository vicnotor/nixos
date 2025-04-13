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

-- Open the Thunar file explorer
set("n", "<leader>th", "<CMD>silent !silent thunar .<CR>", { desc = "Open Thunar in working directory", silent = true })

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
	require("conform").format({ lsp_fallback = true, quiet = true })
end, { desc = "Format file" })

-- Switch to next window
set("n", "<tab>", "<cmd>winc w<CR>", { desc = "Change focus to next vim window", silent = true })

-- Toggle wrap
set("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "Toggle wrap", silent = true })

-- Toggle the color scheme
set("n", "<leader>co", function()
	ToggleColorScheme()
end, { desc = "Toggle theme", silent = true })

-- Toggle ZenMode
set("n", "<F11>", "<cmd>ZenMode<CR>", { desc = "Start ZenMode", silent = true })

-- Open current file in browser
set("n", "gX", "<cmd>silent !google-chrome-stable % &<CR>", { desc = "Open current file in Chrome" })

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

-- mdtopdf
set("n", "<leader>mdp", "<cmd>!mdtopdf %<CR>", { desc = "Markdown to pdf" })

-- Other
set("n", "J", "mzJ`z")
set("i", "<C-c>", "<Esc>")
set("n", "Q", "<nop>")

-- Functions
vim.cmd([[command! -nargs=0 W :w]])
vim.cmd([[command! -nargs=0 WQ :wq]])
vim.cmd([[command! -nargs=0 Wq :wq]])
vim.cmd([[command! -nargs=0 Q :q]])

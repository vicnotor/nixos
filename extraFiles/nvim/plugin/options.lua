-- See `:help vim.opt`

vim.opt.inccommand = "split"

-- List mode
vim.opt.list = false -- Set to true to enable this:
vim.opt.listchars = { leadmultispace = "·", tab = "» ", trail = "·", nbsp = "␣" }

-- Set highlight off on search
vim.opt.hlsearch = false

-- Default split style
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Make relative line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500

-- Tab width
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Indentation
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Disable line wrap
vim.opt.wrap = false

-- Enable break indent for wrap mode
vim.opt.breakindent = true

-- Undo history settings
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"


-- Formatting options
vim.opt.formatoptions:remove("o")
vim.opt.formatoptions:remove("t")
vim.opt.formatoptions:remove("c")

-- Other settings
vim.opt.termguicolors = true
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.colorcolumn = "78"
vim.diagnostic.config({ virtual_text = false, virtual_lines = false })

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

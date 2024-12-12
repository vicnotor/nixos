return {
	{
		"ThePrimeagen/harpoon",
		lazy = false,
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			local set = vim.keymap.set

			-- REQUIRED
			harpoon:setup({
				settings = {
					save_on_toggle = true,
					sync_on_ui_close = true,
				},
			})

			-- keymaps
			set("n", "<leader>a", function()
				harpoon:list():add()
			end, { desc = "Add to Harpoon list" })
			set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Open Harpoon list" })

			set("n", "<C-b>", function()
				harpoon:list():select(1)
			end, { desc = "Harpoon tab 1" })
			set("n", "<C-n>", function()
				harpoon:list():select(2)
			end, { desc = "Harpoon tab 2" })
			set("n", "▶", function()
				harpoon:list():select(3)
			end, { desc = "Harpoon tab 3", noremap = true })
			set("n", "★", function()
				harpoon:list():select(4)
			end, { desc = "Harpoon tab 3", noremap = true })

			for _, idx in ipairs({ 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 }) do
				set("n", string.format("<leader>%d", idx), function()
					harpoon:list():select(idx)
				end, { desc = string.format("Harpoon tab %d", idx) })
			end
		end,
	},
}

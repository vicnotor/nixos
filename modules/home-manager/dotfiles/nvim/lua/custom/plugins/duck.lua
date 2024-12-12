return {
	{
		"tamton-aquib/duck.nvim",
		opts = {},
		config = function()
			local animals = { "🐫", "🦆", "🐧", "🐆", "🦩", "🐓", "🐈", "🦀", "🐀" }
			vim.keymap.set("n", "<leader>;;", function()
				if vim.o.filetype == "ocaml" then
					require("duck").hatch("🐫", math.random(2, 5))
				else
					require("duck").hatch(animals[math.random(#animals)], math.random(2, 5))
				end
			end, { desc = "Hatch animal" })
			vim.keymap.set("n", "<leader>;k", function()
				require("duck").cook_all()
			end, {})
		end,
	},
}

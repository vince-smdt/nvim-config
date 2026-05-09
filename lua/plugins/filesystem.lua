vim.pack.add({
	{ src = GH .. "stevearc/oil.nvim" },
	{ src = GH .. "nvim-mini/mini.icons" },
})

require("mini.icons").setup({})

require("oil").setup({
	view_options = {
		show_hidden = true,
	},
})

-- TODO: remove later
vim.opt.packpath:prepend(vim.fn.stdpath("data") .. "/site")
-- TODO: remove later

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

-- TODO: remove later
return {}
-- TODO: remove later

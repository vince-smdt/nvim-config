-- TODO: remove later
vim.opt.packpath:prepend(vim.fn.stdpath("data") .. "/site")
-- TODO: remove later

vim.pack.add({
	{ src = GH .. "neanias/everforest-nvim" },
})

require("everforest").setup({
	transparent_background_level = 1,
})
vim.cmd([[colorscheme everforest]])

-- TODO: remove later
return {}
-- TODO: remove later

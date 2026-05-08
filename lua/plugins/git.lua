-- TODO: remove later
vim.opt.packpath:prepend(vim.fn.stdpath("data") .. "/site")
-- TODO: remove later

vim.pack.add({
	{ src = GH .. "tpope/vim-fugitive" },
	{ src = GH .. "lewis6991/gitsigns.nvim" },
})

local maps = {
	{
		k = "<leader>gb",
		d = "Git: Blame",
		m = "<cmd>G blame<CR>",
	},
	{
		k = "<leader>gd",
		d = "<cmd>Gdiffsplit<CR>",
		m = "Git: Diff",
	},
	{
		k = "<leader>gpl",
		d = "<cmd>G pull<CR>",
		m = "Git: Pull",
	},
	{
		k = "<leader>gps",
		d = "<cmd>G push<CR>",
		m = "Git: Push",
	},
	{
		k = "<leader>gs",
		d = "<cmd>G status<CR>",
		m = "Git: Status",
	},
}

for _, map in ipairs(maps) do
	vim.keymap.set("n", map.k, map.m, { desc = map.d })
end

local gitsigns = require("gitsigns")

gitsigns.setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
})

-- TODO: remove later
return {}

vim.pack.add({
	{ src = GH .. "tpope/vim-fugitive" },
	{ src = GH .. "lewis6991/gitsigns.nvim" },
})

local maps = {
	{
		k = "<leader>gb",
		d = "Git: Blame",
		m = function()
			vim.cmd("G blame")
		end,
	},
	{
		k = "<leader>gd",
		d = "Git: Diff",
		m = function()
			vim.cmd("Gdiffsplit")
		end,
	},
	{
		k = "<leader>gpl",
		d = "Git: Pull",
		m = function()
			vim.cmd("G pull")
		end,
	},
	{
		k = "<leader>gps",
		d = "Git: Push",
		m = function()
			vim.cmd("G push")
		end,
	},
	{
		k = "<leader>gs",
		d = "Git: Status",
		m = function()
			vim.cmd("G status")
		end,
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

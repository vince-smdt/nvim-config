return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gb", "<cmd>G blame<CR>", { desc = "Git: Blame" })
			vim.keymap.set("n", "<leader>gd", "<cmd>Gdiffsplit<CR>", { desc = "Git: Diff" })
			vim.keymap.set("n", "<leader>gpl", "<cmd>G pull<CR>", { desc = "Git: Pull" })
			vim.keymap.set("n", "<leader>gps", "<cmd>G push<CR>", { desc = "Git: Push" })
			vim.keymap.set("n", "<leader>gs", "<cmd>G status<CR>", { desc = "Git: Status" })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
}

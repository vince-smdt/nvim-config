vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		vim.pack.add({
			{ src = GH .. "nvim-treesitter/nvim-treesitter" },
		})

		require("nvim-treesitter.config").setup({
			ensure_installed = {
				"c",
				"cpp",
				"diff",
				"help",
				"lua",
				"luadoc",
				"python",
				"query",
				"vim",
				"vimdoc",
			},
			auto_install = true,
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})

		vim.cmd("TSUpdate")
	end,
})

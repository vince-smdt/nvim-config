vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		vim.pack.add({
			{ src = GH .. "folke/todo-comments.nvim" },
			{ src = GH .. "nvim-lua/plenary.nvim" },
		})

		require("todo-comments").setup({ signs = false })
	end,
})

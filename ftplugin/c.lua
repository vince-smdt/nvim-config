vim.pack.add({
	{
		src = "https://github.com/p00f/clangd_extensions.nvim",
	},
})

vim.keymap.set("n", "gs", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header (C/C++)" })

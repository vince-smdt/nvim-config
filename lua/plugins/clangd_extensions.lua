return {
	"p00f/clangd_extensions.nvim",
	config = function()
		vim.keymap.set("n", "gs", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header (C/C++)" })
	end,
}

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	main = "nvim-treesitter.config",
	opts = {
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
	},
}

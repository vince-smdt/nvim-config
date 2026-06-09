vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
})

local everforest = require("lualine.themes.everforest")

require("lualine").setup({
	options = { theme = everforest },
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "lsp_status" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})

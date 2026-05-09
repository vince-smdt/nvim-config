GH = "https://github.com/"

require("config.options")
require("config.remap")
require("config.autocmd")
require("config.schedule")

for _, name in ipairs({
	"surround",
	"filesystem",
	"harpoon",
	"git",
	"colorscheme",
	"which-key",
	"autocompletion",
	"todo",
	"dap",
	"flash",
	"autoformat",
	"telescope",
	"treesitter",
	"lsp",
}) do
	require("plugins." .. name)
end

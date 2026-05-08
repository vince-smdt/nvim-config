-- TODO: remove later
vim.opt.packpath:prepend(vim.fn.stdpath("data") .. "/site")
-- TODO: remove later

vim.pack.add({
	{ src = GH .. "ThePrimeagen/harpoon", version = "harpoon2" },
})

local harpoon = require("harpoon")

harpoon:setup()

local maps = {
	{
		k = "<leader>a",
		d = "Harpoon add file",
		m = function()
			harpoon:list():add()
		end,
	},
	{
		k = "<C-e>",
		d = "Harpoon menu",
		m = function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end,
	},
	{
		k = "<C-h>",
		d = "Harpoon file 1",
		m = function()
			harpoon:list():select(1)
		end,
	},
	{
		k = "<C-j>",
		d = "Harpoon file 2",
		m = function()
			harpoon:list():select(2)
		end,
	},
	{
		k = "<C-k>",
		d = "Harpoon file 3",
		m = function()
			harpoon:list():select(3)
		end,
	},
	{
		k = "<C-l>",
		d = "Harpoon file 4",
		m = function()
			harpoon:list():select(4)
		end,
	},
	{
		k = "<C-p>",
		d = "Harpoon previous",
		m = function()
			harpoon:list():prev()
		end,
	},
	{
		k = "<C-n>",
		d = "Harpoon next",
		m = function()
			harpoon:list():next()
		end,
	},
}

for _, map in ipairs(maps) do
	vim.keymap.set("n", map.k, map.m, { desc = map.d })
end

-- TODO: remove later
return {}
-- TODO: remove later

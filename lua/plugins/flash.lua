-- TODO: remove later
vim.opt.packpath:prepend(vim.fn.stdpath("data") .. "/site")
-- TODO: remove later

vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		vim.pack.add({
			{ src = GH .. "folke/flash.nvim" },
		})

		require("flash").setup({})

		vim.keymap.set({ "n", "x", "o" }, "s", function()
			require("flash").jump()
		end, { desc = "Flash" })
		vim.keymap.set({ "n", "x", "o" }, "S", function()
			require("flash").treesitter()
		end, { desc = "Flash Treesitter" })
		vim.keymap.set("o", "r", function()
			require("flash").remote()
		end, { desc = "Remote Flash" })
		vim.keymap.set({ "o", "x" }, "R", function()
			require("flash").treesitter_search()
		end, { desc = "Treesitter Search" })
		vim.keymap.set("c", "<c-s>", function()
			require("flash").toggle()
		end, { desc = "Toggle Flash Search" })
	end,
})

-- TODO: remove later
return {}
-- TODO: remove later

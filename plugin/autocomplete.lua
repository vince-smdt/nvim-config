vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		vim.pack.add({
			{ src = GH .. "saghen/blink.lib" },
			{ src = GH .. "saghen/blink.cmp" },
			{ src = GH .. "L3MON4D3/LuaSnip" },
			{ src = GH .. "folke/lazydev.nvim" },
		})

		if vim.fn.has("win32") ~= 1 and vim.fn.executable("make") == 1 then
			local luasnip_dir = vim.fn.stdpath("data") .. "/site/pack/core/opt/LuaSnip"
			if vim.fn.isdirectory(luasnip_dir) == 1 then
				vim.fn.system("make -C " .. vim.fn.shellescape(luasnip_dir) .. " install_jsregexp")
			end
		end

		require("blink.cmp").setup({
			keymap = { preset = "default" },
			completion = {
				documentation = { auto_show = false, auto_show_delay_ms = 500 },
			},
			sources = {
				default = { "lsp", "path", "snippets", "lazydev" },
				providers = {
					lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
				},
			},
			snippets = { preset = "luasnip" },
			fuzzy = { implementation = "lua" },
			signature = { enabled = true },
		})
	end,
})

vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		vim.pack.add({
			{ src = GH .. "neovim/nvim-lspconfig" },
			{ src = GH .. "mason-org/mason.nvim" },
			{ src = GH .. "mrcjkb/rustaceanvim" },
		})

		require("mason").setup()

		vim.g.rustaceanvim = {
			server = {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			},
		}

		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			if vim.bo[buf].filetype == "rust" then
				vim.api.nvim_buf_call(buf, function()
					vim.cmd("runtime! ftplugin/rust.lua")
				end)
			end
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("grn", vim.lsp.buf.rename, "Rename")
				map("ga", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
				map("gd", require("telescope.builtin").lsp_definitions, "Definition")
				map("gD", vim.lsp.buf.declaration, "Declaration")
				map("gR", require("telescope.builtin").lsp_references, "References")
				map("gI", require("telescope.builtin").lsp_implementations, "Implementation")
				map("gy", require("telescope.builtin").lsp_type_definitions, "Type Definition")
				map("gO", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
				map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")
				map("<leader>th", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
				end, "Toggle Inlay Hints")
			end,
		})

		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = vim.g.have_nerd_font and {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			} or {},
			virtual_text = { source = "if_many", spacing = 2 },
		})

		local capabilities = require("blink.cmp").get_lsp_capabilities()

		vim.lsp.config("clangd", { capabilities = capabilities })
		vim.lsp.config("basedpyright", { capabilities = capabilities })
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})

		vim.lsp.enable({ "clangd", "basedpyright", "lua_ls" })
	end,
})

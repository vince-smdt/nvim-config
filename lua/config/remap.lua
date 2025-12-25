vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>fe", vim.cmd.Ex)

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

local function client_supports_method(client, method, bufnr)
	if vim.fn.has("nvim-0.11") == 1 then
		return client:supports_method(method, bufnr)
	else
		return client.supports_method(method, { bufnr = bufnr })
	end
end

-- DESKTOP GCS (Sirius)
local build_project = function(project)
	vim.cmd(
		'!"C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\Msbuild\\Current\\Bin\\MSBuild.exe" sirius-gcs.sln /t:'
			.. project
			.. " /p:Configuration=Debug /p:Platform=x64"
	)
end

local launch_project = function(project)
	vim.cmd('!"out\\bin\\Debug\\' .. project .. '.exe"')
end

vim.keymap.set("n", "<leader>ba", function()
	build_project("sirius-gcs")
end, { desc = "Build sirius-gcs application" })

vim.keymap.set("n", "<leader>bt", function()
	build_project("sirius-gcs-tests")
end, { desc = "Build sirius-gcs tests" })

vim.keymap.set("n", "<leader>ea", function()
	launch_project("sirius-gcs")
end, { desc = "Launch sirius-gcs application" })

vim.keymap.set("n", "<leader>et", function()
	launch_project("sirius-gcs-tests")
end, { desc = "Launch sirius-gcs tests" })

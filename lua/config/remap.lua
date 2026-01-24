vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>fe", vim.cmd.Oil)
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>O", { noremap = true })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>o", vim.diagnostic.open_float, { desc = "Open diagnostic float" })

-- DESKTOP GCS (Sirius)

local build_solution = function(project)
	vim.cmd("!.\\setup\\generate_vs_solution.bat && .\\setup\\generate_compile_commands_debug.bat")
end

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

vim.keymap.set("n", "<leader>bs", function()
	build_solution("sirius-gcs")
end, { desc = "Build sirius-gcs solution" })

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

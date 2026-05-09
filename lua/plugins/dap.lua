vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		vim.pack.add({
			{ src = GH .. "mfussenegger/nvim-dap" },
			{ src = GH .. "nvim-neotest/nvim-nio" },
			{ src = GH .. "rcarriga/nvim-dap-ui" },
			{ src = GH .. "mfussenegger/nvim-dap-python" },
			{ src = GH .. "theHamsta/nvim-dap-virtual-text" },
		})

		local dap = require("dap")
		local dapui = require("dapui")

		require("dapui").setup({})
		require("nvim-dap-virtual-text").setup({
			commented = true,
		})

		require("dap-python").setup("python")

		vim.fn.sign_define("DapBreakpoint", {
			text = "",
			texthl = "DiagnosticSignError",
			linehl = "",
			numhl = "",
		})

		vim.fn.sign_define("DapBreakpointRejected", {
			text = "",
			texthl = "DiagnosticSignError",
			linehl = "",
			numhl = "",
		})

		vim.fn.sign_define("DapStopped", {
			text = "",
			texthl = "DiagnosticSignWarn",
			linehl = "Visual",
			numhl = "DiagnosticSignWarn",
		})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end

		local function opts_with_desc(desc)
			return { noremap = true, silent = true, desc = desc }
		end

		vim.keymap.set("n", "<leader>db", function()
			dap.toggle_breakpoint()
		end, opts_with_desc("DAP: Toggle Breakpoint"))

		vim.keymap.set("n", "<leader>dc", function()
			dap.continue()
		end, opts_with_desc("DAP: Continue / Start"))

		vim.keymap.set("n", "<leader>do", function()
			dap.step_over()
		end, opts_with_desc("DAP: Step Over"))

		vim.keymap.set("n", "<leader>di", function()
			dap.step_into()
		end, opts_with_desc("DAP: Step Into"))

		vim.keymap.set("n", "<leader>dO", function()
			dap.step_out()
		end, opts_with_desc("DAP: Step Out"))

		vim.keymap.set("n", "<leader>dq", function()
			require("dap").terminate()
		end, opts_with_desc("DAP: Terminate Debugging"))

		vim.keymap.set("n", "<leader>du", function()
			dapui.toggle()
		end, opts_with_desc("DAP: Toggle UI"))
	end,
})

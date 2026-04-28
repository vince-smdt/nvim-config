return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap-python",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dap_python = require("dap-python")

		require("dapui").setup({})
		require("nvim-dap-virtual-text").setup({
			commented = true, -- Show virtual text alongside comment
		})

		dap_python.setup("python")

		vim.fn.sign_define("DapBreakpoint", {
			text = "",
			texthl = "DiagnosticSignError",
			linehl = "",
			numhl = "",
		})

		vim.fn.sign_define("DapBreakpointRejected", {
			text = "", -- or "❌"
			texthl = "DiagnosticSignError",
			linehl = "",
			numhl = "",
		})

		vim.fn.sign_define("DapStopped", {
			text = "", -- or "→"
			texthl = "DiagnosticSignWarn",
			linehl = "Visual",
			numhl = "DiagnosticSignWarn",
		})

		-- Automatically open/close DAP UI
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end

		local opts = { noremap = true, silent = true }

		local opts_with_desc = function(desc_msg)
			return vim.tbl_extend("force", opts, { desc = desc_msg })
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
}

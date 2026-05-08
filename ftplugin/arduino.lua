vim.pack.add({
	{ src = GH .. "ChausseBenjamin/vim-arduino" },
})

local maps = {
	{
		d = "[A]rduino [A]ttach",
		k = "<leader>aa",
		m = function()
			vim.cmd("ArduinoAttach")
		end,
	},
	{
		d = "[A]rduino [V]erify",
		k = "<leader>av",
		m = function()
			vim.cmd("ArduinoVerify")
		end,
	},
	{
		d = "[A]rduino [U]pload",
		k = "<leader>au",
		m = function()
			vim.cmd("ArduinoUpload")
		end,
	},
	{
		d = "[A]rduino [O]bserve (upload+serial)",
		k = "<leader>ao",
		m = function()
			vim.cmd("ArduinoUploadAndSerial")
		end,
	},
	{
		d = "[A]rduino [S]erial",
		k = "<leader>as",
		m = function()
			vim.cmd("ArduinoSerial")
		end,
	},
	{
		d = "[A]rduino choose [B]oard",
		k = "<leader>ab",
		m = function()
			vim.cmd("ArduinoChooseBoard")
		end,
	},
	{
		d = "[A]rduino choose [P]rogrammer",
		k = "<leader>ap",
		m = function()
			vim.cmd("ArduinoChooseProgrammer")
		end,
	},
}
for _, map in ipairs(maps) do
	vim.keymap.set("n", map.k, map.m, { buf = 0, desc = map.d })
end

-- Hardcoded values for University-provided ESP32 board:
vim.g.arduino_board = "esp32:esp32:esp32"
vim.g.arduino_serial_baud = 9600
vim.g.arduino_programmer = ""
vim.g.arduino_cli_args = "-v --no-color"
vim.g.arduino_serial_cmd = "picocom {port} -b {baud}"

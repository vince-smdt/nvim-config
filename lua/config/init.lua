GH = "https://github.com/"

require("config.options")
require("config.remap")
require("config.autocmd")
require("config.schedule")
require("config.lazy")

-- lazy.nvim strips stdpath('data')/site from packpath, but vim.pack.add
-- relies on it to find already-installed plugins via :packadd.
vim.opt.packpath:prepend(vim.fn.stdpath("data") .. "/site")

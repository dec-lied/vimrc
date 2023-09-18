-- -- -- -- -- -- -- --
--  config/opts.lua  --
-- -- -- -- -- -- -- --

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- tab configuration
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smartindent = false -- tree sitter indent

vim.opt.hlsearch = true
vim.opt.incsearch = true

-- disable line wrap
vim.opt.wrap = false

vim.opt.hidden = true

vim.opt.undofile = true
vim.opt.swapfile = false

vim.opt.undodir = vim.fn.stdpath("data") .. "\\undo\\"
vim.opt.backupdir = vim.fn.stdpath("data") .. "\\backups\\"

vim.opt.scrolloff = 10

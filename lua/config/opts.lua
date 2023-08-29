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
vim.opt.smartindent = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

-- disable line wrap
vim.opt.wrap = false

vim.opt.hidden = true

vim.opt.dir = vim.fn.stdpath("data") .. "\\swap\\"
vim.opt.undodir = vim.fn.stdpath("data") .. "\\undo\\"
vim.opt.backupdir = vim.fn.stdpath("data") .. "\\backups\\"

vim.opt.scrolloff = 10

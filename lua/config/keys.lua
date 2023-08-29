-- -- -- -- -- -- -- --
--  config/keys.lua  --
-- -- -- -- -- -- -- --

-- -- -- -- -- -- -- --
--  options objects  --
-- -- -- -- -- -- -- --
local opts = { noremap = true }
local sopts = { noremap = true, silent = true }

-- -- -- -- -- -- -- -- --
--   leader key setup   --
-- -- -- -- -- -- -- -- --
vim.g.mapleader = " "
vim.keymap.set("n", "<Space>", "<Nop>", sopts)

-- -- -- -- -- -- -- --
-- editing shortcuts --
-- -- -- -- -- -- -- --
vim.keymap.set("n", "<C-c>", "cc", sopts)
vim.keymap.set("n", "<C-d>", "dd", sopts)

-- -- -- -- -- -- -- -- -- -- -- --
--   file navigation shortcuts   --
-- -- -- -- -- -- -- -- -- -- -- --
vim.keymap.set("n", "<C-k>", "<C-u>zz", sopts)
vim.keymap.set("n", "<C-j>", "<C-d>zz", sopts)
vim.keymap.set("n", "<C-e>", "<Cmd>Explore<CR>", sopts)

-- -- -- -- -- -- --
-- misc shortcuts --
-- -- -- -- -- -- --
vim.keymap.set("n", "<C-u>", "<Cmd>nohl<CR>", sopts)

-- -- -- -- -- -- -- -- --
--  telescope keybinds  --
-- -- -- -- -- -- -- -- --
vim.keymap.set('n', '<leader>ff', "<Cmd>Telescope find_files<CR>", sopts)
vim.keymap.set('n', '<C-f>', "<Cmd>Telescope find_files<CR>", sopts)
vim.keymap.set('n', '<leader>fg', "<Cmd> Telescope live_grep<CR>", sopts)
vim.keymap.set('n', '<leader>fb', "<Cmd> Telescope buffers<CR>", sopts)
vim.keymap.set('n', '<leader>fh', "<Cmd> Telescope help_tags<CR>", sopts)

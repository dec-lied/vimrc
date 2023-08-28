-- general opts
local opts = { noremap = true }
local sopts = { noremap = true, silent = true }

-- leader key
vim.g.mapleader = " "
vim.keymap.set("n", "<Space>", "<Nop>", sopts)

-- global shortcuts
vim.keymap.set("n", "<C-c>", "cc", sopts)
vim.keymap.set("n", "<C-d>", "dd", sopts)

-- file navigation shortcuts
vim.keymap.set("n", "<C-k>", "<C-u>zz", sopts)
vim.keymap.set("n", "<C-j>", "<C-d>zz", sopts)

-- misc shortcuts
vim.keymap.set("n", "<C-o>", "<Cmd>nohl<CR>", sopts)

-- telescope keybinds
local telescope_builtin = require("telescope.builtin")

vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})



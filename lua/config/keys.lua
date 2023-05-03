-- keymap settings
local opts = { noremap = true }
local sopts = { noremap = true, silent = true }

-- utility functions
-- local function getHighlightUnderCursor()
--     print(vim.inspect(vim.treesitter.get_captures_at_cursor(0)))
-- end

-- defining leader key
vim.g.mapleader = " "
vim.keymap.set('n',     '<Space>',      '<Nop>',                                            sopts)

-- color & highlight group stuff
-- vim.keymap.set('n',     '<leader>h',    getHighlightUnderCursor,                            sopts)
vim.keymap.set('n',     '<leader>cz',   '<Cmd>ColorizerToggle<CR>',                         sopts)
vim.keymap.set('n',     '<C-u>',        '<Cmd>nohl<CR>',                                    sopts)

-- misc
vim.keymap.set('n',     '<C-e>',        '<Cmd>!explorer .<CR>',                             sopts)

-- shortcuts
vim.keymap.set('n',     '<C-c>',        'cc',                                               sopts)
vim.keymap.set('n',     '<C-d>',        'dd',                                               sopts)

-- file scrolling + center on cursor
vim.keymap.set('n',     '<C-S-j>',      '<C-d>zz',                                          sopts)
vim.keymap.set('n',     '<C-S-k>',      '<C-u>zz',                                          sopts)

-- mass copy and paste
vim.keymap.set('n',     'gc',           '<Cmd>%y+<CR>',                                     opts)
vim.keymap.set('n',     'gv',           '<Cmd>%d<CR>"+P<CR>',                               opts)

-- trouble
vim.keymap.set('n',     'tt',           '<Cmd>TroubleToggle<CR>',                           opts);
vim.keymap.set('n',     'tc',           '<Cmd>TroubleClose<CR>',                            opts);
vim.keymap.set('n',     'tr',           '<Cmd>TroubleRefresh<CR>',                          opts);

-- rust
vim.keymap.set('n',     '<leader>rr',   '<Cmd>!cargo run<CR>',                              opts)
vim.keymap.set('n',     '<leader>rb',   '<Cmd>!cargo build<CR>',                            opts)
vim.keymap.set('n',     '<leader>rn',   '<Cmd>!cargo build --release<CR>',                  opts)
vim.keymap.set('n',     '<leader>rt',   '<Cmd>!cargo test<CR>',                             opts)
vim.keymap.set('n',     '<leader>rcr',  '<Cmd>CargoReload<CR>',                             opts)

-- python
vim.keymap.set('n',     '<leader>p',    '<Cmd>!python %:p<CR>',                             opts)

-- neotree
vim.keymap.set('n',     '<C-n>',        '<Cmd>Neotree<CR>',  sopts)

-- telescope
vim.keymap.set('n',     '<C-f>',        '<Cmd>Telescope find_files<CR>',                    sopts)
vim.keymap.set('n',     '<leader>ff',   '<Cmd>Telescope find_files<CR>',                    sopts)
vim.keymap.set('n',     '<leader>fb',   '<Cmd>Telescope buffers<CR>',                       sopts)
vim.keymap.set('n',     '<leader>fg',   '<Cmd>Telescope live_grep<CR>',                     sopts)
vim.keymap.set('n',     '<leader>fh',   '<Cmd>Telescope help_tags<CR>',                     sopts)

-- harpoon
vim.keymap.set('n',     '<leader>hh',   '<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>',  opts)
vim.keymap.set('n',     '<leader>ha',   '<Cmd>lua require("harpoon.mark").add_file()<CR>',  opts)
vim.keymap.set('n',     '<A-1>',        '<Cmd>lua require("harpoon.ui").nav_file(1)<CR><Cmd>sleep 1m<CR>zz',   opts)
vim.keymap.set('n',     '<A-2>',        '<Cmd>lua require("harpoon.ui").nav_file(2)<CR><Cmd>sleep 1m<CR>zz',   opts)
vim.keymap.set('n',     '<A-3>',        '<Cmd>lua require("harpoon.ui").nav_file(3)<CR><Cmd>sleep 1m<CR>zz',   opts)
vim.keymap.set('n',     '<A-4>',        '<Cmd>lua require("harpoon.ui").nav_file(4)<CR><Cmd>sleep 1m<CR>zz',   opts)
vim.keymap.set('n',     '<A-5>',        '<Cmd>lua require("harpoon.ui").nav_file(5)<CR><Cmd>sleep 1m<CR>zz',   opts)
vim.keymap.set('n',     '<A-6>',        '<Cmd>lua require("harpoon.ui").nav_file(6)<CR><Cmd>sleep 1m<CR>zz',   opts)

-- window navigation
vim.keymap.set('n',     '<C-h>',        '<Cmd>wincmd h<CR>',                                sopts)
vim.keymap.set('n',     '<C-j>',        '<Cmd>wincmd j<CR>',                                sopts)
vim.keymap.set('n',     '<C-k>',        '<Cmd>wincmd k<CR>',                                sopts)
vim.keymap.set('n',     '<C-l>',        '<Cmd>wincmd l<CR>',                                sopts)

-- toggle term keys
vim.keymap.set('n',     '<leader>tt',   '<Cmd>ToggleTerm direction=float<CR>',                  sopts)
vim.keymap.set('t',     '<C-t>',        '<C-\\><C-n>:q<CR>',                           sopts)
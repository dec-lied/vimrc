-- keymap settings
local opts = { noremap = true }
local sopts = { noremap = true, silent = true }

-- utility functions
local function getHighlightUnderCursor()
    print(vim.inspect(vim.treesitter.get_captures_at_cursor(0)))
end

local function openPdf()
    local filename = vim.fn.expand("%:p:r") .. ".pdf"
    vim.fn.execute("silent !" .. filename)
end

-- defining leader key
vim.g.mapleader = " "
vim.keymap.set('n',     '<Space>',      '<Nop>',                                            sopts)

-- color & highlight group stuff
vim.keymap.set('n',     '<leader>h',    getHighlightUnderCursor,                            sopts)
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

-- latex
vim.keymap.set('n',     '<leader>lc',   '<Cmd>TexlabBuild<CR>',                             sopts)
vim.keymap.set('n',     '<leader>lv',   openPdf,                                            sopts)

-- python
vim.keymap.set('n',     '<leader>p',    '<Cmd>!python %:p<CR>',                             opts)

-- nvim tree
vim.keymap.set('n',     '<C-n>',        '<Cmd>NvimTreeFocus<CR> <Cmd>NvimTreeRefresh<CR>',  sopts)

-- telescope
vim.keymap.set('n',     '<C-f>',        '<Cmd>Telescope find_files<CR>',                    sopts)
vim.keymap.set('n',     '<leader>fb',   '<Cmd>Telescope buffers<CR>',                       sopts)
vim.keymap.set('n',     '<leader>fh',   '<Cmd>Telescope help_tags<CR>',                     sopts)

-- window navigation
vim.keymap.set('n',     '<C-h>',        '<Cmd>wincmd h<CR>',                                sopts)
vim.keymap.set('n',     '<C-j>',        '<Cmd>wincmd j<CR>',                                sopts)
vim.keymap.set('n',     '<C-k>',        '<Cmd>wincmd k<CR>',                                sopts)
vim.keymap.set('n',     '<C-l>',        '<Cmd>wincmd l<CR>',                                sopts)

-- tab navigation
vim.keymap.set('n',     '<A-j>',        '<Cmd>BufferMovePrevious<CR>',                      sopts)
vim.keymap.set('n',     '<A-k>',        '<Cmd>BufferMoveNext<CR>',                          sopts)
vim.keymap.set('n',     '<A-h>',        '<Cmd>BufferPrevious<CR>',                          sopts)
vim.keymap.set('n',     '<A-l>',        '<Cmd>BufferNext<CR>',                              sopts)

vim.keymap.set('n',     '<A-1>',        '<Cmd>BufferGoto 1<CR>',                            sopts)
vim.keymap.set('n',     '<A-2>',        '<Cmd>BufferGoto 2<CR>',                            sopts)
vim.keymap.set('n',     '<A-3>',        '<Cmd>BufferGoto 3<CR>',                            sopts)
vim.keymap.set('n',     '<A-4>',        '<Cmd>BufferGoto 4<CR>',                            sopts)
vim.keymap.set('n',     '<A-5>',        '<Cmd>BufferGoto 5<CR>',                            sopts)
vim.keymap.set('n',     '<A-6>',        '<Cmd>BufferGoto 6<CR>',                            sopts)
vim.keymap.set('n',     '<A-7>',        '<Cmd>BufferGoto 7<CR>',                            sopts)
vim.keymap.set('n',     '<A-8>',        '<Cmd>BufferGoto 8<CR>',                            sopts)
vim.keymap.set('n',     '<A-9>',        '<Cmd>BufferGoto 9<CR>',                            sopts)

vim.keymap.set('n',     '<A-d>',        '<Cmd>BufferClose<CR>',                             sopts)

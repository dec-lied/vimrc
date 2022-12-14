vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd.colorscheme "oxocarbon"

-- oxocarbon edits
-- simple
-- vim.cmd[[highlight Conditional                          guifg=#78a9ff]]
-- vim.cmd[[highlight Include                              guifg=#ff7eb6]]
-- vim.cmd[[highlight BufferCurrentMod                     guifg=#be95ff]]
-- vim.cmd[[highlight BufferDefaultCurrentMod              guifg=#be95ff]]
-- vim.cmd[[highlight DiagnosticHint                       guifg=pink]]

vim.api.nvim_set_hl(0, 'Conditional',                   { fg = "#78a9ff" })
vim.api.nvim_set_hl(0, 'Include',                       { fg = "#ff7eb6" })
vim.api.nvim_set_hl(0, 'BufferCurrentMod',              { fg = "#be95ff" })
vim.api.nvim_set_hl(0, 'BufferDefaultCurrentMod',       { fg = "#be95ff" })
vim.api.nvim_set_hl(0, 'DiagnosticHint',                { fg = "pink" })

-- comments
-- vim.cmd[[highlight Comment                              guifg=#585858]]
-- vim.cmd[[highlight @comment                             guifg=#606060]]
-- vim.cmd[[highlight SpecialComment                       guifg=#ff7eb6]]

vim.api.nvim_set_hl(0, 'Comment',                       { fg = "#585858" })
vim.api.nvim_set_hl(0, '@comment',                      { fg = "#606060" })
vim.api.nvim_set_hl(0, 'SpecialComment',                { fg = "#ff73b6" })

-- types
-- vim.cmd[[highlight Type                                 guifg=#be95ff]]
-- vim.cmd[[highlight @type.builtin                        guifg=#be95ff]]

vim.api.nvim_set_hl(0, 'Type',                          { fg = "#be95ff" })
vim.api.nvim_set_hl(0, '@type.builtin',                 { fg = "#be95ff" })

-- functions / methods
-- vim.cmd[[highlight Function                             guifg=#ff7eb6]]
-- vim.cmd[[highlight @function                            guifg=#ff7eb6 cterm=NONE gui=NONE]]
-- vim.cmd[[highlight @function.macro                      guifg=#ff7eb6 cterm=NONE gui=NONE]]
-- vim.cmd[[highlight @method.call                         guifg=#ff7eb6 cterm=NONE gui=NONE]]

vim.api.nvim_set_hl(0, 'Function',                      { fg = "#ff7eb6", cterm = NONE, gui = NONE })
vim.api.nvim_set_hl(0, '@function',                     { fg = "#ff7eb6", cterm = NONE, gui = NONE })
vim.api.nvim_set_hl(0, '@function.macro',               { fg = "#ff7eb6", cterm = NONE, gui = NONE })
vim.api.nvim_set_hl(0, '@method.call',                  { fg = "#ff7eb6", cterm = NONE, gui = NONE })

-- macros
-- vim.cmd[[highlight Macro                                guifg=#ff7eb6]]

vim.api.nvim_set_hl(0, 'Macro',                         { fg = "#ff7eb6" })

-- constants
-- vim.cmd[[highlight @constant.macro                      guifg=#ff7eb6]]
-- vim.cmd[[highlight @constant.builtin                    guifg=#ff7eb6]]
-- vim.cmd[[highlight @punctuation.bracket                 guifg=#d0d0d0]]

vim.api.nvim_set_hl(0, '@constant.macro',               { fg = "#ff7eb6" })
vim.api.nvim_set_hl(0, '@constant.builtin',             { fg = "#ff7eb6" })
vim.api.nvim_set_hl(0, '@punctuation.bracket',          { fg = "#d0d0d0" })


-- indentline edits
-- vim.cmd[[highlight IndentBlanklineChar                  guifg=#393939   gui=nocombine]]
-- vim.cmd[[highlight IndentBlanklineSpaceChar             guifg=#393939   gui=nocombine]]
-- vim.cmd[[highlight IndentBlanklineContextChar           guifg=#78a9ff   gui=nocombine]]
-- vim.cmd[[highlight IndentBlanklineContextStart          guifg=#393939   gui=nocombine]]
-- vim.cmd[[highlight IndentBlanklineSpaceCharBlankline    guifg=#393939   gui=nocombine]]

vim.api.nvim_set_hl(0, 'IndentBlanklineChar',                   { fg = "#393939", gui = nocombine })
vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceChar',              { fg = "#393939", gui = nocombine })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar',            { fg = "#78a9ff", gui = nocombine })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextStart',           { fg = "#393939", gui = nocombine })
vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceCharBlankline',     { fg = "#393939", gui = nocombine })

--vim.cmd[[highlight StatusLine                           guifg=#161616]]
--vim.cmd[[highlight StatusLineNC                         guifg=#161616]]

vim.api.nvim_set_hl(0, 'StatusLine',                    { fg = "#161616", bold = true, reverse = true, cterm = bold, cterm = reverse })
vim.api.nvim_set_hl(0, 'StatusLineNC',                  { fg = "#161616", reverse = true, cterm = reverse })

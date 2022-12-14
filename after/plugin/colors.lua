vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd.colorscheme "oxocarbon"

-- oxocarbon edits
vim.cmd[[highlight Conditional                          guifg=#78a9ff]]
vim.cmd[[highlight Include                              guifg=#ff7eb6]]
vim.cmd[[highlight SpecialComment                       guifg=#ff7eb6]]
vim.cmd[[highlight Comment                              guifg=#484848]]
vim.cmd[[highlight BufferCurrentMod                     guifg=#be95ff]]
vim.cmd[[highlight BufferDefaultCurrentMod              guifg=#be95ff]]
vim.cmd[[highlight DiagnosticHint                       guifg=pink]]

-- types
vim.cmd[[highlight Type                                 guifg=#be95ff]]
vim.cmd[[highlight @type.builtin                        guifg=#be95ff]]

-- functions / methods
vim.cmd[[highlight Function                             guifg=#ff7eb6]]
vim.cmd[[highlight @function                            guifg=#ff7eb6 cterm=NONE gui=NONE]]
vim.cmd[[highlight @function.macro                      guifg=#ff7eb6 cterm=NONE gui=NONE]]
vim.cmd[[highlight @method.call                         guifg=#ff7eb6 cterm=NONE gui=NONE]]

-- macros
vim.cmd[[highlight Macro                                guifg=#ff7eb6]]

-- constants
vim.cmd[[highlight @constant.macro                      guifg=#ff7eb6]]
vim.cmd[[highlight @constant.builtin                    guifg=#ff7eb6]]
vim.cmd[[highlight @punctuation.bracket                 guifg=#d0d0d0]]


-- indentline edits
vim.cmd[[highlight IndentBlanklineSpaceCharBlankline    guifg=#393939   gui=nocombine]]
vim.cmd[[highlight IndentBlanklineContextStart          guifg=#393939   gui=nocombine]]
vim.cmd[[highlight IndentBlanklineContextChar           guifg=#393939   gui=nocombine]]
vim.cmd[[highlight IndentBlanklineChar                  guifg=#393939   gui=nocombine]]
vim.cmd[[highlight IndentBlanklineSpaceChar             guifg=#393939   gui=nocombine]]

-- lightline
-- vim.g.lightline = { 'colorscheme' : 'wombat' }

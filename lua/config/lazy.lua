-- -- -- -- -- -- -- --
-- lazy.nvim prelude --
-- -- -- -- -- -- -- --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
    {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- -- -- -- -- -- -- -- --
-- plugin configuration --
-- -- -- -- -- -- -- -- --

plugins =
{
    -- -- -- -- -- -- --
    -- colorscheme --
    -- -- -- -- -- --
    {
        "declspecl/candy-floss",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme candy-floss]])
        end
    },

    -- -- -- --
    --  lsp  --
    -- -- -- --
    {
        "hrsh7th/nvim-cmp",
        lazy = false,
        dependencies =
        {
            "hrsh7th/cmp-nvim-lsp",
            "neovim/nvim-lspconfig"
        }
    },
    {
        "L3MON4D3/LuaSnip",
        version = "1.*",
        dependencies =
        {
            "rafamadriz/friendly-snippets"
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()

            -- setting up lsp servers

            local on_attach = function()
                vim.keymap.set('n', '<leader>sa', vim.lsp.buf.hover, { remap = false } )
                vim.keymap.set('n', '<leader>ss', vim.lsp.buf.definition, { remap = false } )
                vim.keymap.set('n', '<leader>sd', vim.lsp.buf.declaration, { remap = false } )
                vim.keymap.set('n', '<leader>sr', vim.lsp.buf.references, { remap = false } )
                vim.keymap.set('n', '<leader>sh', vim.lsp.buf.signature_help, { remap = false } )
            end
            
            local capabilities = require'cmp_nvim_lsp'.default_capabilities()
            
            local lsp_flags =
            {
                debounce_text_changes = 150
            }
            
            local servers = { "clangd", "pyright" }
            
            for _, server in pairs(servers) do
                require'lspconfig'[server].setup
                {
                    on_attach = on_attach,
                    lsp_flags = lsp_flags,
                    capabilities = capabilities
                }
            end
            
            -- setting up lspkind
            local lspkind = require("lspkind")
            
            local source_mapping =
            {
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                path = "[Path]",
            }
            
            -- setting up nvim-cmp
            local cmp = require("cmp")
            cmp.setup
            {
                sources =
                {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' }
                },
                snippet =
                {
                    expand = function(args)
                        require'luasnip'.lsp_expand(args.body)
                    end
                },
                window =
                {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered()
                },
                mapping =
                {
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-i>'] = cmp.mapping.scroll_docs(4),
                    ['<Up>'] = cmp.mapping.select_prev_item(),
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<Down>'] = cmp.mapping.select_next_item(),
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<C-Tab>'] = cmp.mapping.confirm(
                    {
                        select = true,
                    },
                    {'i', 'c'})
                },
                formatting =
                {
                    format = lspkind.cmp_format(
                    {
                        mode = 'symbol_text',
                        ellipses_char = '...',
            
                        before = function(entry, item)
                            item.kind = lspkind.presets.default[item.kind]
            
                            item.menu = source_mapping[entry.source.name]
            
                            return item
                        end
                    })
                }
            }

            -- setting up rust analyzer
            require("lspconfig").rust_analyzer.setup(
            {
                on_attach = on_attach,
                lsp_flags = lsp_flags,
                capabilities = capabilities,
                cmd = { "rustup", "run", "nightly", "rust-analyzer" },

                settings =
                {
                    ["rust-analyzer"] =
                    {
                        cargo =
                        {
                            autoreload = true,
                            checkOnSave = true
                        },
                        check =
                        {
                            command = "check"
                        }
                    }
                }
            })

            require("lspconfig").lua_ls.setup(
            {
                settings =
                {
                    Lua =
                    {
                        runtime =
                        {
                            version = "LuaJIT"
                        },
                        diagnostics =
                        {
                            globals = { "vim" }
                        },
                        telemetry =
                        {
                            enable = false,
                        }
                    }
                }
            })
        end
    },
    "onsails/lspkind.nvim",
    "folke/trouble.nvim",
    "j-hui/fidget.nvim",

    -- -- -- -- --
    --   navi   --
    -- -- -- -- --
    "ThePrimeagen/harpoon",
    {
        "nvim-telescope/telescope.nvim",
        dependencies =
        {
            "nvim-telescope/telescope-live-grep-args.nvim",
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require'telescope'.load_extension('live_grep_args')
            require'telescope'.load_extension('harpoon')
        end
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies =
        {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
            vim.cmd([[ Neotree ]])
        end
    },

    -- -- -- -- -- -- -- -- --
    --   syntax / editing   --
    -- -- -- -- -- -- -- -- --
    {
        "nvim-treesitter/nvim-treesitter",
        opts =
        {
            ensure_installed = { "c", "cpp", "css", "scss", "vim", "lua", "html", "rust", "java", "python", "javascript", "markdown", "markdown_inline" }, -- latex handled by texlab
            sync_install = false,
            auto_install = false,

            highlight =
            {
                enable = true
            }
        }
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        opts =
        {
            show_current_context = true
        }
    },
    "windwp/nvim-autopairs",

    -- -- -- -- -- -- --
    --  misc visuals  --
    -- -- -- -- -- -- --
    {
        "nvim-lualine/lualine.nvim",
        dependencies =
        {
            "nvim-tree/nvim-web-devicons"
        },
        opts =
        {
            options =
            {
                icons_enabled = true,
                theme = 'candy-floss',
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = { 'NvimTree' },
                always_divide_middle = true
            },
            sections =
            {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c =
                {
                    { "filename" }
                },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" }
            },
            inactive_sections =
            {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "filetype" },
                lualine_z = { "location" }
            },
            tabline = {},
            extensions = {}
        }
    },
    "norcalli/nvim-colorizer.lua"
}

require("lazy").setup(plugins)
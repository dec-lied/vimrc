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

local plugins =
{
    -- -- -- -- -- -- --
    -- colorscheme --
    -- -- -- -- -- --
    -- {
    --     "rebelot/kanagawa.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require("kanagawa").setup(
    --         {
    --             compile = true,
    --             keywordStyle = { italic = false },
    --             statementStyle = { bold = false },
    --             transparent = false,
    --         })

    --         vim.cmd([[colorscheme kanagawa]])
    --     end
    -- },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight-night]])
        end
    },
    -- {
    --   "loctvl842/monokai-pro.nvim",
    --   lazy = false,
    --   priority = 1000,
    --   config = function()
    --       vim.cmd([[colorscheme monokai-pro]])
    --   end
    -- },

    -- -- -- --
    --  lsp  --
    -- -- -- --
    {
        "hrsh7th/nvim-cmp",
        dependencies =
        {
            "hrsh7th/cmp-nvim-lsp",
            "neovim/nvim-lspconfig"
        },
        init = function()
            -- setting up lsp servers
            local on_attach = function()
                vim.keymap.set("n",     "<leader>sa",   vim.lsp.buf.hover,            { remap = false } )
                vim.keymap.set("n",     "<leader>ss",   vim.lsp.buf.definition,       { remap = false } )
                vim.keymap.set("n",     "<leader>sd",   vim.lsp.buf.declaration,      { remap = false } )
                vim.keymap.set("n",     "<leader>sr",   vim.lsp.buf.references,       { remap = false } )
                vim.keymap.set("n",     "<leader>sh",   vim.lsp.buf.signature_help,   { remap = false } )
            end

            local capabilities = require"cmp_nvim_lsp".default_capabilities()

            local lsp_flags =
            {
                debounce_text_changes = 150
            }

            local servers = { "html", "cssls", "eslint", "tsserver", "svelte", "clangd", "pyright" }

            for _, server in pairs(servers) do
                require("lspconfig")[server].setup(
                {
                    on_attach = on_attach,
                    lsp_flags = lsp_flags,
                    capabilities = capabilities
                })
            end

            require("lspconfig").cmake.setup(
            {
                filetypes = { "cmake" }
            })

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

            -- setting up luals
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
                            enable = false
                        }
                    }
                }
            })
        end
    },
    {
        "L3MON4D3/LuaSnip",
        version = "1.*",
        dependencies =
        {
            "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim"
        },
        init = function()
            -- loading snippets
            require("luasnip.loaders.from_vscode").lazy_load()

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
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" }
                },
                snippet =
                {
                    expand = function(args)
                        require"luasnip".lsp_expand(args.body)
                    end
                },
                window =
                {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered()
                },
                mapping =
                {
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-i>"] = cmp.mapping.scroll_docs(4),
                    ["<Up>"] = cmp.mapping.select_prev_item(),
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<Down>"] = cmp.mapping.select_next_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-Tab>"] = cmp.mapping.confirm(
                    {
                        select = true,
                    },
                    {"i", "c"})
                },
                formatting =
                {
                    format = lspkind.cmp_format(
                    {
                        mode = "symbol_text",
                        ellipses_char = "...",

                        before = function(entry, item)
                            item.kind = lspkind.presets.default[item.kind]

                            item.menu = source_mapping[entry.source.name]

                            return item
                        end
                    })
                }
            }
        end
    },
    { "folke/trouble.nvim", config = true },
    { "j-hui/fidget.nvim", tag = "legacy", config = true },

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
            require"telescope".load_extension("live_grep_args")
            require"telescope".load_extension("harpoon")

            local actions = require("telescope.actions")

            require("telescope").setup(
            {
                defaults =
                {
                    file_ignore_patterns = { ".git", ".vs", ".sln", ".vcxproj", ".vcxproj.user", ".vcxproj.filters" },
                    mappings =
                    {
                        i =
                        {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-Tab>"] = actions.select_default
                        },
                        n =
                        {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-Tab>"] = actions.select_default
                        }
                    }
                }
            })
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
            vim.g.neo_tree_remove_legacy_commands = "1"

            require("neo-tree").setup(
            {
                filesystem =
                {
                    filtered_items =
                    {
                        visible = true,
                        hide_dotfiles = false,
                        hide_gitignored = false
                    }
                },
                default_component_configs =
                {
                    git_status =
                    {
                        symbols = false
                        -- {
                        --     added       = "[+]",
                        --     deleted     = "[-]",
                        --     modified    = "~",
                        --     renamed     = "r",

                        --     untracked   = "u?",
                        --     ignored     = "i?",
                        --     unstaged    = "u",
                        --     staged      = "s",
                        --     conflict    = "c"
                        -- }
                    }
                }
            })

            vim.cmd("Neotree source=filesystem reveal=true position=left")
        end
    },
    -- {
    --     "akinsho/bufferline.nvim",
    --     version = "*",
    --     dependencies =
    --     {
    --         "nvim-tree/nvim-web-devicons"
    --     },
    --     config = true
    -- },
    {
        "utilyre/barbecue.nvim",
        version = "*",
        dependencies =
        {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("barbecue").setup
            {
                theme = "monokai-pro"
            }
        end
    },
    {
        "akinsho/toggleterm.nvim",
        opts =
        {
            terminal_mappings = true
        },
        version = "*",
        config = true
    },

    -- -- -- -- -- -- -- -- --
    --   syntax / editing   --
    -- -- -- -- -- -- -- -- --
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts =
        {
            ensure_installed = { "c", "cpp", "css", "vim", "lua", "html", "rust", "svelte", "python", "javascript", "typescript" }, -- latex handled by texlab

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
    { "windwp/nvim-autopairs", config = true },

    -- -- -- -- -- -- --
    --  misc visuals  --
    -- -- -- -- -- -- --
    {
        "nvim-lualine/lualine.nvim",
        dependencies =
        {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("lualine").setup(
            {
                options =
                {
                    icons_enabled = true,
                    theme = "nightfly",
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = { "neo-tree" },
                    always_divide_middle = true
                },
                sections =
                {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { "filename" },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" }
                },
                inactive_sections =
                {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" }
                },
                tabline = {},
                extensions = {}
            })
        end
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 1000

            require("which-key").setup()
        end
    },
    { "norcalli/nvim-colorizer.lua", config = true }
}

-- -- -- -- -- -- -- -- -- -- -- -- -- --
--   actually setting plugin configs   --
-- -- -- -- -- -- -- -- -- -- -- -- -- --
require("lazy").setup(plugins)

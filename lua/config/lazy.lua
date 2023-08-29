-- -- -- -- -- -- -- -- --
-- general plugin setup --
-- -- -- -- -- -- -- -- --

local plugins =
{
	-- -- -- -- -- --
	-- colorscheme --
	-- -- -- -- -- --
	{
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        init = function()
			vim.cmd([[colorscheme tokyonight-night]])
        end
	},

	-- -- -- -- -- -- -- -- -- --
	--   syntax highlighting   --
	-- -- -- -- -- -- -- -- -- --
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate"
		-- "c", "cpp", "go", "vim", "lua", "css", "tsx", "html", "json", "rust", "python", "javascript"
	},

	-- -- -- -- --
	--   navi   --
	-- -- -- -- --
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies =
		{
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
			}
		},
		init = function()
			local actions = require("telescope.actions")

			require("telescope").setup
			{
				defaults =
				{
					-- file_ignore_patterns = { ".git", ".vs", ".sln", ".vcxproj", ".vcxproj.user", ".vcxproj.filters" },
                    mappings =
                    {
                        i =
                        {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        }
                    }
				}
			}

			require("telescope").load_extension("fzf")
		end
	},

	-- -- -- -- -- -- -- -- --
	--    lsp + snippets    --
	-- -- -- -- -- -- -- -- --
	{ "folke/neodev.nvim", opts = {} },

    "hrsh7th/cmp-nvim-lsp",
	"hrsh7th/vim-vsnip",
	"hrsh7th/cmp-vsnip",
	"rafamadriz/friendly-snippets",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",

    "neovim/nvim-lspconfig",

    "onsails/lspkind.nvim",

	{
        "hrsh7th/nvim-cmp",
        init = function()
			-- snippets setup
			local cmp = require("cmp")
			local lspkind = require("lspkind")

            local source_mapping =
            {
                buffer = "[buffer]",
                nvim_lsp = "[lsp]",
				vsnip = "[vsnip]",
                path = "[path]"
            }

			cmp.setup
			{
				snippet =
				{
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end
				},
                sources = cmp.config.sources(
				{
                    { name = "nvim_lsp" },
					{ name = "vsnip" },
                    { name = "path" },
					{ name = "buffer" }
				}),
                window =
                {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered()
                },
                mapping = cmp.mapping.preset.insert(
                {
                    -- ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-i>"] = cmp.mapping.scroll_docs(4),
                    ["<Up>"] = cmp.mapping.select_prev_item(),
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<Down>"] = cmp.mapping.select_next_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<Tab>"] = cmp.mapping.confirm({ select = true })
                }),
                formatting =
                {
                    format = lspkind.cmp_format(
                    {
                        mode = "text_symbol",
                        ellipses_char = "...",

                        before = function(entry, item)
                            item.kind = lspkind.presets.default[item.kind]

                            item.menu = source_mapping[entry.source.name]

                            return item
                        end
                    })
                }
			}

            -- setting up lsp servers
            local on_attach = function()
                vim.keymap.set("n", "<leader>sa", vim.lsp.buf.hover, { remap = false } )
                vim.keymap.set("n", "<leader>ss", vim.lsp.buf.definition, { remap = false } )
                vim.keymap.set("n", "<leader>sd", vim.lsp.buf.declaration, { remap = false } )
                vim.keymap.set("n", "<leader>sr", vim.lsp.buf.references, { remap = false } )
                vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, { remap = false } )
            end

            local capabilities = require"cmp_nvim_lsp".default_capabilities()

			local servers =
			{
				-- web
				"html", "cssls", "eslint", "tsserver", "tailwindcss",

				-- misc
				"cmake", "gopls", "clangd", "pyright"
			}

            for _, server in pairs(servers) do
                require("lspconfig")[server].setup
                {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            end

            -- setting up rust analyzer
            require("lspconfig").rust_analyzer.setup
            {
                on_attach = on_attach,
                capabilities = capabilities,
                cmd = { "rustup", "run", "nightly", "rust-analyzer" },

                settings =
                {
                    ["rust-analyzer"] =
                    {
                        cargo =
                        {
                            autoreload = true,
                            checkOnSave = true,
							allFeatures = true
                        },
                        check =
                        {
                            command = "check"
                        }
                    }
                }
            }

            -- setting up luals
            require("lspconfig").lua_ls.setup
            {
				on_attach = on_attach,
				capabilities = capabilities,

                settings =
                {
                    Lua =
                    {
                        diagnostics =
                        {
                            globals = { "vim" }
                        },
						workspace =
						{
							checkThirdParty = false
						},
                        telemetry =
                        {
                            enable = false
                        }
                    }
                }
            }
        end
    },

	-- -- -- -- -- -- --
	-- misc / visuals --
	-- -- -- -- -- -- --
	{ "folke/trouble.nvim", opts = {} },

    {
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		opts = {}
	},

    { "windwp/nvim-autopairs", opts = {} },

	{
		"folke/which-key.nvim",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = {}
	},

	{
		"lukas-reineke/indent-blankline.nvim",
        opts =
        {
            show_current_context = true
        }
    },

    {
        "utilyre/barbecue.nvim",
        dependencies =
        {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons"
        },
		opts = {}
    }
}

-- -- -- -- -- -- -- --
--  lazy.nvim setup  --
-- -- -- -- -- -- -- --
local lazypath = vim.fn.stdpath("data") .. "\\lazy\\lazy.nvim"

if not vim.loop.fs_stat(lazypath)
then
    vim.fn.system(
    {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins)

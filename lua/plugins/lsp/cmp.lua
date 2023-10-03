-- -- -- -- -- -- -- -- -- --cmp
--   plugins/lsp/cmp.lua   --
-- -- -- -- -- -- -- -- -- --

return
{
    "neovim/nvim-lspconfig",
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-nvim-lsp",

	{
        "hrsh7th/nvim-cmp",
        dependencies =
        {
            -- snippets
			{
				"dcampos/cmp-snippy",
				dependencies =
				{
					"dcampos/nvim-snippy",
					"honza/vim-snippets"
				}
			},
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path"
        },
        config = function()
			-- snippets setup
			local cmp = require("cmp")
			local lspkind = require("lspkind")

            local source_mapping =
            {
                buffer = "[buffer]",
                nvim_lsp = "[lsp]",
				snippy = "[snippy]",
                path = "[path]"
            }

			cmp.setup(
			{
				snippet =
				{
					expand = function(args)
						require("snippy").expand_snippet(args.body)
					end
				},
                sources = cmp.config.sources(
				{
                    { name = "nvim_lsp" },
					{ name = "snippy" },
                    { name = "path" },
					{ name = "buffer" }
				}),
                window =
                {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered()
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
                        mode = "symbol_text",
                        ellipses_char = "...",

                        before = function(entry, item)
                            item.menu = source_mapping[entry.source.name]

                            return item
                        end
                    })
                }
			})

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
				"html", "cssls", "eslint", "tsserver", "tailwindcss", "emmet_language_server",

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

            -- setting up luals
            require("lspconfig").lua_ls.setup
            {
				on_attach = on_attach,
				capabilities = capabilities,

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
    }
}

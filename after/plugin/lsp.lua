-- -- -- -- -- -- -- --
-- general lsp setup -- 
-- -- -- -- -- -- -- --

local on_attach = function()
    vim.keymap.set('n', '<leader>a', vim.lsp.buf.hover, { remap = false} )
    vim.keymap.set('n', '<leader>s', vim.lsp.buf.definition, { remap = false} )
    vim.keymap.set('n', '<leader>d', vim.lsp.buf.declaration, { remap = false} )
end

local capabilities = require'cmp_nvim_lsp'.default_capabilities()

local lsp_flags =
{
    debounce_text_changes = 150
}

local servers = { 'clangd', 'pyright', 'texlab' }

for _, server in pairs(servers) do
    require'lspconfig'[server].setup
    {
        on_attach = on_attach,
        lsp_flags = lsp_flags,
        capabilities = capabilities
    }
end

-- -- -- -- -- -- -- -- --
--   hrsh7th/nvim-cmp   --
-- -- -- -- -- -- -- -- --

local lspkind = require'lspkind'

local source_mapping =
{
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	vsnip = "[Snippet]",
	path = "[Path]",
}

local cmp = require'cmp'
cmp.setup
{
    snippet =
    {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
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
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<C-Tab>'] = cmp.mapping.confirm(
        {
            select = true,
        }, {'i', 'c'})
    },
    sources = cmp.config.sources(
    {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'vsnip' },
        { name = 'path' }
    }),
    formatting =
    {
		format = function(entry, item)
			item.kind = lspkind.presets.default[item.kind]

			item.menu = source_mapping[entry.source.name]

			return item
		end,
	}
}



-- -- -- -- -- -- --
-- rust lsp setup --
-- -- -- -- -- -- --

require'lspconfig'.rust_analyzer.setup
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
                autoreload = true
            },
            checkOnSave =
            {
                command = "check"
            }
        },

        rust =
        {
            unstable_features = true,
            build_on_save = false,
            all_features = true
        }
    }
}

-- -- -- -- -- -- -- --
--   lua lsp setup   --
-- -- -- -- -- -- -- --
require'lspconfig'.sumneko_lua.setup
{
    on_attach = on_attach,
    lsp_flags = lsp_flags,
    capabilities = capabilities,

    settings =
    {
        Lua =
        {
            runtime =
            {
                version = 'LuaJIT'
            },
            diagnostics =
            {
                globals = { 'vim' }
            },
            workspace =
            {
                vim.api.nvim_get_runtime_file("", true)
            },
            telemetry =
            {
                enable = false
            }
        }
    }
}

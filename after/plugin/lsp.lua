-- -- -- -- -- -- -- -- --
--  folke/trouble.nvim  --
-- -- -- -- -- -- -- -- --

require'trouble'.setup{}

-- -- -- -- -- -- -- --
-- general lsp setup -- 
-- -- -- -- -- -- -- --

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

local servers = { 'html', 'cssls', 'clangd', 'pyright', 'texlab' }

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
	path = "[Path]",
}

local cmp = require'cmp'
cmp.setup
{
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
    sources = cmp.config.sources(
    {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
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
                autoreload = true,
                checkOnSave = true
            },
            check=
            {
                command = "check"
            }
        }
    }
}

-- -- -- -- -- -- -- -- -- -- -- -- -- --
--   nvim-treesitter/nvim-treesitter   --
-- -- -- -- -- -- -- -- -- -- -- -- -- --

require'nvim-treesitter.configs'.setup
{
    ensure_installed = { "c", "cpp", "css", "scss", "vim", "lua", "html", "rust", "java", "python", "javascript", "markdown", "markdown_inline" }, -- latex handled by texlab
    sync_install = false,
    auto_install = false,

    highlight =
    {
        enable = true
    }
}

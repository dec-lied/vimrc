-- -- -- -- -- -- -- -- -- -- -- -- -- --
--   nvim-treesitter/nvim-treesitter   --
-- -- -- -- -- -- -- -- -- -- -- -- -- --

require'nvim-treesitter.configs'.setup
{
    ensure_installed = { "c", "cpp", "css", "vim", "lua", "rust", "java", "python", "markdown" }, -- latex handled by texlab
    sync_install = false,
    auto_install = false,

    highlight =
    {
        enable = true
    }
}

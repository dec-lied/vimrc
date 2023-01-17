-- -- -- -- -- -- -- -- -- -- -- --
-- nvim-telescope/telescope.nvim --
-- -- -- -- -- -- -- -- -- -- -- --

require'telescope'.setup
{
    defaults =
    {
        file_ignore_patterns = { ".git" }
    },
}

-- -- -- -- -- -- -- -- --
-- ThePrimeagen/harpoon --
-- -- -- -- -- -- -- -- --
require'harpoon'.setup{}

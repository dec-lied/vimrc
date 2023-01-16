-- -- -- -- -- -- -- -- --
--  romgrk/barbar.nvim  --
-- -- -- -- -- -- -- -- --

vim.g.bufferline =
{
    animation = false,
    closable = false,
    icons = true
}

-- -- -- -- -- -- -- -- --
-- dec-lied/candy-floss --
-- -- -- -- -- -- -- -- --

-- need to call barbar setup here because it loads too late, so the highlight groups are reset

require'candy-floss'.setup_barbar()

-- -- -- -- -- -- -- -- -- -- -- --
--    nvim-tree/nvim-tree.lua    --
-- -- -- -- -- -- -- -- -- -- -- --

require'nvim-tree'.setup
{
    disable_netrw = true,
    open_on_setup = true,
    hijack_unnamed_buffer_when_opening = true,
    sync_root_with_cwd = true, -- actions { change_dir { global } } may have conflicts if this is enabled

    view =
    {
        adaptive_size = true,
        relativenumber = true,
        signcolumn = "no",

        mappings =
        {
            list =
            {
                { key = "<BS>",  action = "dir_up" },
                { key = ".",     action = "cd"}
            },
        },
    },
    renderer =
    {
        symlink_destination = false,

        icons =
        {
            show =
            {
                git = false
            }
        }
    },
    filesystem_watchers =
    {
        enable = false,
    },
    update_focused_file =
    {
        enable = false
    },
    actions =
    {
        change_dir =
        {
            enable = true,
            global = true
        }
    }
}

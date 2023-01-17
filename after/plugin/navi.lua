-- -- -- -- -- -- -- -- -- -- -- --
--    nvim-tree/nvim-tree.lua    --
-- -- -- -- -- -- -- -- -- -- -- --

require'nvim-tree'.setup
{
    disable_netrw = true,
    open_on_setup = true,
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
            git_placement = "after",
            show =
            {
                git = true
            },
            glyphs =
            {
                git =
                {
                    unstaged = "~",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            }
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" }
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
            global = false
        }
    }
}

-- -- -- -- -- -- -- -- -- -- -- --
-- nvim-telescope/telescope.nvim --
-- -- -- -- -- -- -- -- -- -- -- --

local actions = require'telescope.actions'

require'telescope'.setup
{
    defaults =
    {
        file_ignore_patterns = { ".git" },
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
}

-- -- -- -- -- -- -- -- --
-- ThePrimeagen/harpoon --
-- -- -- -- -- -- -- -- --
require'harpoon'.setup{}

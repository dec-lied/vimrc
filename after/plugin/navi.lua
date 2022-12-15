-- -- -- -- -- -- -- -- --
--  romgrk/barbar.nvim  --
-- -- -- -- -- -- -- -- --

vim.g.bufferline =
{
    animation = false,
    closable = false,
    icons = true
}

-- -- -- -- -- -- -- -- -- -- -- --
--    nvim-tree/nvim-tree.lua    --
-- -- -- -- -- -- -- -- -- -- -- --

vim.cmd[[
	augroup NvimTreeStart
    	autocmd!
    	autocmd VimEnter * silent! cd ~/
		autocmd VimEnter * silent! :NvimTreeFocus
  	augroup end
]]

require'nvim-tree'.setup
{
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
        enable = true
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

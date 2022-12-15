require'lualine'.setup
{
    options =
    {
        icons_enabled = true,
        theme = 'candy-floss',
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { 'NvimTree' },
        always_divide_middle = true
    },
    sections =
    {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c =
        {
            { "filename" }
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" }
    },
    inactive_sections =
    {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "filetype" },
        lualine_z = { "location" }
    },
    tabline = {},
    extensions = {}
}

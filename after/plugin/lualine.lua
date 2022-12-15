local lualine_theme = require'lualine.themes.auto'

lualine_theme =
{
    normal =
    {
        a = { bg = "#0e0e0e", fg = "#d0d0d0", gui = 'bold' },
        b = { bg = "#101010", fg = "#be95ff" },
        c = { bg = "#121212", fg = "#78a9ff" }
    },
    insert = 
    {
        a = { bg = "#0e0e0e", fg = "#ff7eb6", gui = 'bold' },
        b = { bg = "#101010", fg = "#be95ff" },
        c = { bg = "#121212", fg = "#78a9ff" }
    },
    command = 
    {
        a = { bg = "#0e0e0e", fg = "#ee5396", gui = 'bold' },
        b = { bg = "#101010", fg = "#be95ff" },
        c = { bg = "#121212", fg = "#78a9ff" }
    },
    visual = 
    {
        a = { bg = "#0e0e0e", fg = "#78a9ff", gui = 'bold' },
        b = { bg = "#101010", fg = "#be95ff" },
        c = { bg = "#121212", fg = "#78a9ff" }
    }
}

require'lualine'.setup
{
    options =
    {
        icons_enabled = true,
        theme = lualine_theme,
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

-- -- -- -- -- -- -- -- -- -- --
--  plugins/misc/neovide.lua  --
-- -- -- -- -- -- -- -- -- -- --

if vim.g.neovide then
    vim.o.guifont = "Iosevka Nerd Font Mono:h16"
    vim.g.neovide_cursor_animation_length = 0

    return {
        {
            "nvimdev/dashboard-nvim",
            event = "VimEnter",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            config = function()
                require("dashboard").setup {}
            end
        },
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
              "nvim-lua/plenary.nvim",
              "nvim-tree/nvim-web-devicons",
              "MunifTanjim/nui.nvim",
              -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
            }
        }
    }
else
    return {}
end

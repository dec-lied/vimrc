-- -- -- -- -- -- -- -- -- -- --
--  plugins/misc/neovide.lua  --
-- -- -- -- -- -- -- -- -- -- --

if vim.g.neovide then
    vim.o.guifont = "Iosevka Nerd Font Mono:h16"
    vim.g.neovide_cursor_animation_length = 0

    return {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("dashboard").setup {}
        end
    }
else
    return {}
end

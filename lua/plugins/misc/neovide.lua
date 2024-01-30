-- -- -- -- -- -- -- -- -- -- --
--  plugins/misc/neovide.lua  --
-- -- -- -- -- -- -- -- -- -- --

if vim.g.neovide then
    vim.o.guifont = "Iosevka Nerd Font Mono:h16"
    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_scroll_animation_length = 0

    return {
        {
            "nvimdev/dashboard-nvim",
            event = "VimEnter",
            dependencies = {
                "nvim-tree/nvim-web-devicons"
            },
            config = function()
                require("dashboard").setup({
                    theme = "doom",
                    disable_move = false,
                    config = {
                        header = {
                            "                                                                                ",
                            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣷⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⣰⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡄⠀⠖⠀⠈⠙⠛⠛⠛⠙⠊⠀⠤⠋⢀⠎⢠⠄⠠⠀⠀⣀⣀⡀⠀⢠⠀⣄⠘⣄⠈⠦⠀⠈⠊⠙⠛⠛⠋⠑⠀⠐⠆⠀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣀⡤⠀⠀⠈⡄⠰⠆⢀⠜⠉⠉⠉⠑⠒⣤⣀⠀⣸⡀⢠⣄⣀⣿⣿⣇⣀⡬⠀⣼⠀⢀⣤⠖⠂⠉⠉⠉⠛⣀⠀⠆⠀⡏⠀⠀⠠⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⣠⡞⢋⣉⣀⣐⠒⠓⢀⣀⣉⣀⣀⣀⣀⣚⠛⠻⠯⣀⠈⠉⣀⣸⠉⢹⣿⠉⢹⣀⡈⠉⢀⠨⠟⠛⢓⣀⣀⣀⣀⣈⣁⣀⠚⠓⢂⣀⣈⡉⠳⣄⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣧⠈⣿⠩⡟⠭⠽⠭⠉⣉⣉⣉⣉⣉⣉⡙⠛⠶⣦⣈⠂⢌⠛⢀⣽⣿⣅⠝⢉⠔⢈⣤⡶⠞⢛⣉⣉⣉⣉⣉⣉⡉⠭⠿⠭⠹⡯⣹⠇⢠⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⠀⣿⡇⡿⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡌⠻⣷⣄⠡⠈⢿⣿⠃⠐⢁⣼⡟⢉⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⢸⡇⣿⡄⢸⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⢿⣿⣿⠀⣿⡇⢣⣿⣿⣿⣿⠋⠁⢀⠀⠉⢻⣿⣿⣿⣿⡆⠘⣿⡆⠀⢸⣿⠀⠀⣾⡟⢀⣾⣿⣿⣿⡿⠋⠁⢀⠀⠉⢻⣿⣿⣿⡇⠃⣿⡇⢸⣿⣿⠿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣶⣾⣿⣶⣝⢿⡄⢹⣇⠘⣿⣿⣿⣿⣄⡀⠈⠀⣀⣼⣿⣿⣿⣿⢇⡇⣿⡇⠀⢸⡿⠀⠀⣿⡇⡎⢿⣿⣿⣿⣷⣄⡀⠈⢀⣀⣾⣿⣿⣿⡟⢠⡿⠀⣾⢏⣴⣿⣿⣶⣦⣤⣀⠀⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⣀⣠⣴⣶⣿⣿⣿⣿⣿⣿⣿⡿⠿⠈⠳⢄⠹⣦⡈⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠃⢸⠰⣿⣷⠀⠀⠀⠀⣴⣿⡇⣹⠈⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⣠⠟⢁⠜⠁⠸⠿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣤⣀⠀⠀",
                            "⠀⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣥⣂⠀⠈⠙⠳⢦⣬⣍⣉⣛⣛⣉⣭⣵⣒⣒⣒⡬⠷⢹⣿⡤⠾⠿⠦⣾⣿⠰⠧⣔⣒⣒⣲⣭⣍⣛⣛⣋⣩⣥⡴⠶⠛⠁⠀⢀⣢⣥⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠀",
                            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣿⣿⣿⣿⣿⣿⣆⢦⣤⣀⡀⠈⠉⠉⠉⠉⠉⠉⠉⠉⡙⠻⣿⠟⢡⣴⣾⣿⣶⣌⠙⣿⡟⢋⡉⠉⠉⠉⠉⠉⠉⠉⠉⢀⣀⣠⣤⢂⣾⣿⣿⣿⣿⣿⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⠀⠀⠀⢀⣠⣾⣿⡿⠿⠿⠛⠛⠉⠉⠁⠀⣈⣽⣽⣛⠻⣿⣿⣿⣿⣿⣿⡷⠀⠸⠀⡟⢀⣿⠿⢿⣿⠿⣿⣆⠸⡄⢨⠀⠰⣿⣿⣿⣿⣿⣿⠿⣛⣻⣿⣍⠀⠈⠉⠉⠛⠛⠻⠿⠿⣿⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⣿⡦⠻⠿⠿⢛⣉⠤⠒⡡⠊⣠⣾⣿⠖⢾⡷⠲⣿⣿⣦⡙⠄⠑⠤⣈⡛⠻⠿⠿⠡⣾⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⠿⠟⠛⠉⠁⠀⢀⣾⣶⣶⣤⣄⠡⣴⣾⣿⣿⣿⡓⢚⡟⠒⣿⣿⣿⣿⣶⡬⣀⣤⣴⣶⣶⣄⠀⠀⠉⠙⠻⠿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠿⠟⠋⠉⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⡿⠃⠙⠻⠿⣿⣿⣏⣩⣏⣉⣿⣿⡿⠟⠛⠈⠻⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠈⠙⠛⠿⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⠟⠉⠀⠀⠀⠀⠀⠀⠉⠙⠻⠿⠛⠉⠁⠀⠀⠀⠀⠀⠈⠛⢿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠜⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                            "                                                                                ",
                            "                                                                                "
                        },
                        center = {
                            { desc = "Files", desc_hl = "Number", key = "f", key_hl = "@class", action= "Telescope find_files", key_format = "%s" },
                            { desc = "Lazy", desc_hl = "Number", key = "l", key_hl = "@class", action= "Lazy", key_format = "%s" },
                            { desc = "Tree", desc_hl = "Number", key = "t", key_hl = "@class", action = "Neotree", key_format = "%s" },
                            -- inflating length of description to make them all line up a good distance
                            { desc = "Dotfiles           ", desc_hl = "Number", key = "d", key_hl = "@class", action = "cd $NVIM_HOME | Neotree", key_format = "%s" }
                        }
                    }
                })
            end
        },
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons",
                "MunifTanjim/nui.nvim"
            },
            config = function()
                require("neo-tree").setup({
                    filesystem = {
                        filtered_items = {
                            visible = true
                        }
                    },
                    window = {
                        width = 32
                    }
                })
            end
        }
    }
else
    return {}
end
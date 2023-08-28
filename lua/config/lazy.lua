-- -- -- -- -- -- -- -- --
-- general plugin setup --
-- -- -- -- -- -- -- -- --

local plugins =
{
	-- -- -- -- -- --
	-- colorscheme --
	-- -- -- -- -- --
	{
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
			vim.cmd([[colorscheme tokyonight-night]])
        end
	},

	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate"
		-- "c", "cpp", "go", "vim", "lua", "css", "tsx", "html", "json", "rust", "python", "javascript"
	},

	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies =
		{
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
			}
		},
		config = function()
			local actions = require("telescope.actions")

			require("telescope").setup
			{
				defaults =
				{
					-- file_ignore_patterns = { ".git", ".vs", ".sln", ".vcxproj", ".vcxproj.user", ".vcxproj.filters" },
                    mappings =
                    {
                        i =
                        {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        }
                    }
				}
			}

			require("telescope").load_extension("fzf")
		end
	},

	{ "folke/trouble.nvim", config = true },
    { "j-hui/fidget.nvim", tag = "legacy", config = true },
	
	{
		"lukas-reineke/indent-blankline.nvim",
        opts =
        {
            show_current_context = true
        }
    },
    { "windwp/nvim-autopairs", config = true },

    {
        "utilyre/barbecue.nvim",
        version = "*",
        dependencies =
        {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
		config = true
    }
}

-- -- -- -- -- -- -- --
--  lazy.nvim setup  --
-- -- -- -- -- -- -- --
local lazypath = vim.fn.stdpath("data") .. "\\lazy\\lazy.nvim"

if not vim.loop.fs_stat(lazypath)
then
    vim.fn.system(
    {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins)

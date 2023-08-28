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
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies =
		{
			"nvim-lua/plenary.nvim"
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
				},
				pickers =
				{
					find_files =
					{
						hidden = true
					}
				}
			}

			require("telescope").load_extension("fzf")
		end
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

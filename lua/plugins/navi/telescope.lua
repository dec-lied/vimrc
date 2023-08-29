-- -- -- -- -- -- -- -- -- -- --
-- plugins/navi/telescope.lua --
-- -- -- -- -- -- -- -- -- -- --

return {
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
		init = function()
			local actions = require("telescope.actions")

			require("telescope").setup(
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
			})

			require("telescope").load_extension("fzf")
		end
	}
}

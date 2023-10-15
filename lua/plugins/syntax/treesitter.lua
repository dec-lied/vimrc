-- -- -- -- -- -- -- -- -- -- -- --
-- plugins/syntax/treesitter.lua --
-- -- -- -- -- -- -- -- -- -- -- --

return
{
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup
		{
			ensure_installed =
			{
				"c",
				"go",
				"cpp", "lua", "vim", "css", "tsx", "csv",
				"html", "rust", "json", "yaml", "toml", "make", "java",
				"regex", "ninja", "cmake",
				"python", "gitcommit", "gitignore",
				"javascript", "typescript"
			},
			auto_install = true,

			highlight =
			{
				enable = true
			},
			-- indent =
			-- {
				-- 	enable = true
				-- },
				autotag =
				{
					enable = true,
					enable_close_on_slash = false
				}
			}
		end
	}

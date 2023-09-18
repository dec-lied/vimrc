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
			auto_install = true,

			highlight =
			{
				enable = true
			},
			indent =
			{
				enable = true
			},
			autotag =
			{
				enable = true
			}
		}
	end
	-- "c", "cpp", "go", "vim", "lua", "css", "tsx", "html", "json", "rust", "python", "javascript"
}

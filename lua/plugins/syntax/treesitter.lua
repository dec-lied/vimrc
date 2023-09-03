-- -- -- -- -- -- -- -- -- -- -- --
-- plugins/syntax/treesitter.lua --
-- -- -- -- -- -- -- -- -- -- -- --

return
{
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate"
	-- "c", "cpp", "go", "vim", "lua", "css", "tsx", "html", "json", "rust", "python", "javascript"
}

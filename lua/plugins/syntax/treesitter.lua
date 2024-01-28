-- -- -- -- -- -- -- -- -- -- -- --
-- plugins/syntax/treesitter.lua --
-- -- -- -- -- -- -- -- -- -- -- --

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,

			ensure_installed = {
                -- systems / low level
                "c", "cpp", "rust",

                -- misc languages
                "java", "python",

                -- neovim
                "lua", "vim",

                -- config/misc files
                "yaml", "toml", "json", "cmake", "markdown"
            },
			highlight = {
				enable = true
			}
		})

        require("nvim-treesitter.install").compilers = { "clang", "cl" }
	end
}

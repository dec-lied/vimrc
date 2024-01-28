-- -- -- -- -- -- -- -- -- -- -- --
-- plugins/syntax/treesitter.lua --
-- -- -- -- -- -- -- -- -- -- -- --

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
        require("nvim-treesitter.install").compilers = { "clang", "cl" }

		require("nvim-treesitter.configs").setup({
			auto_install = true,

			ensure_installed = {
                -- systems / low level
                "c", "cpp", "rust", "zig",

                -- web languages
                "html", "css", "javascript", "typescript", "tsx",

                -- misc languages
                "java", "python", "go",

                -- neovim
                "lua", "vim",

                -- config/misc files
                "yaml", "toml", "json", "cmake", "markdown"
            },
			highlight = {
				enable = true
			}
		})
	end
}

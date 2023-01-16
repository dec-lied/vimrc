vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function(use)
    -- package manager
	use 'wbthomason/packer.nvim'

    -- colorscheme
    use 'dec-lied/candy-floss'

    -- misc
	use 'j-hui/fidget.nvim'
	use 'MunifTanjim/nui.nvim'
	use 'windwp/nvim-autopairs'
	use 'nvim-lua/plenary.nvim'
	use 'kyazdani42/nvim-web-devicons'
    use 'norcalli/nvim-colorizer.lua'
	use 'lukas-reineke/indent-blankline.nvim'

    use
    {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-web-devicons" }
    }

    use
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }

    -- navigation
	use 'romgrk/barbar.nvim'
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-telescope/telescope.nvim'

    -- lsp
    use "folke/trouble.nvim"
	use 'onsails/lspkind.nvim'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
    use 'sumneko/lua-language-server'

    -- snippets
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/vim-vsnip-integ'
end)

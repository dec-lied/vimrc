vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function(use)
    -- package manager
	use 'wbthomason/packer.nvim'

    -- colorscheme
    use 'dec-lied/candy-floss'

    -- visual
	use 'windwp/nvim-autopairs'
	use 'nvim-lua/plenary.nvim'
    use 'norcalli/nvim-colorizer.lua'
	use 'kyazdani42/nvim-web-devicons'
	use 'lukas-reineke/indent-blankline.nvim'

    use
    {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-web-devicons' }
    }

    -- syntax highlighting
    use
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- navigation
	use 'nvim-tree/nvim-tree.lua'
    use 'ThePrimeagen/harpoon'

    use
    {
        'nvim-telescope/telescope.nvim',
        requires =
        {
            { 'nvim-telescope/telescope-live-grep-args.nvim' },
        },
        config = function()
            require'telescope'.load_extension('live_grep_args')
            require'telescope'.load_extension('harpoon')
        end
    }

    use 'dstein64/vim-startuptime'

    -- lsp
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'neovim/nvim-lspconfig'

    -- snippets
    use 'saadparwaiz1/cmp_luasnip'
    use{ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" }

    -- visual lsp stuff
	use 'j-hui/fidget.nvim'
    use 'folke/trouble.nvim'
	use 'onsails/lspkind.nvim'
end)

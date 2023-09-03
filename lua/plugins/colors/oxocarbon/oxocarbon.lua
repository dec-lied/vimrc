-- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- plugins/colors/oxocarbon/oxocarbon.lua --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return
{
	{
		"nyoom-engineering/oxocarbon.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			vim.cmd([[colorscheme oxocarbon]])
		end
	}
}

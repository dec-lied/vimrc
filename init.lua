-- -- -- -- -- -- -- -- -- -- -- -- --
-- verifying lazy.nvim installation --
-- -- -- -- -- -- -- -- -- -- -- -- --
local lazypath = vim.fn.stdpath("data") .. "\\lazy\\lazy.nvim"

if not vim.loop.fs_stat(lazypath)
then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

-- -- -- -- -- -- -- -- -- --
--   loading user config   --
-- -- -- -- -- -- -- -- -- --
require("config")

-- -- -- -- -- -- -- -- --
--  setting up plugins  --
-- -- -- -- -- -- -- -- --
require("lazy").setup({
	spec =
	{
		{ import = "plugins.colors.oxocarbon" },
		{ import = "plugins.syntax" },
		{ import = "plugins.navi" },
		{ import = "plugins.misc" },
		{ import = "plugins.lsp" }
	}
})

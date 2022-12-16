if vim.g.neovide ~= nil
then
	vim.opt.guifont = { "Cascadia Code PL", "h13" }

	vim.g.neovide_scale_factor = 0.75
    vim.g.neovide_fullscreen = false
    vim.g.neovide_cursor_trail_size = 0.0625
    vim.g.neovide_cursor_animation_length = 0.05
end

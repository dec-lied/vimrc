-- -- -- -- -- -- -- -- -- --
-- plugins/misc/fidget.lua --
-- -- -- -- -- -- -- -- -- --

return
{
    {
		"j-hui/fidget.nvim",
		tag = "legacy",
		config = function()
			require("fidget").setup(
			{
				timer =
				{
					spinner_rate = 100
				},
				debug =
				{
					logging = true
				}
			})
		end
	}
}

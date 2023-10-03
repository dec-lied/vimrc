return
{
	"simrat39/rust-tools.nvim",
	config = function()
		local rt = require("rust-tools")

		rt.setup(
		{
			tools =
			{
				hover_actions =
				{
					auto_focus = true
				}
			},
			server =
			{
				on_attach = function(_, bufnr)
					vim.keymap.set("n", "<leader>ra", rt.hover_actions.hover_actions, { remap = false, buffer = bufnr } )
					vim.keymap.set("n", "<leader>sa", rt.hover_actions.hover_actions, { remap = false, buffer = bufnr } )
					vim.keymap.set("n", "<leader>rs", rt.code_action_group.code_action_group, { remap = false, buffer = bufnr } )
					vim.keymap.set("n", "<leader>ss", rt.code_action_group.code_action_group, { remap = false, buffer = bufnr } )
					vim.keymap.set("n", "<leader>rr", rt.runnables.runnables, { remap = false, buffer = bufnr } )
					vim.keymap.set("n", "<leader>rd", rt.external_docs.open_external_docs, { remap = false, buffer = bufnr } )
					vim.keymap.set("n", "<leader>rc", rt.open_cargo_toml.open_cargo_toml, { remap = false, buffer = bufnr } )
				end,

				settings =
				{
					["rust-analyzer"] =
					{
						cargo =
						{
							autoReload = true,
							checkOnSave = true,
							allFeatures = true
						},
						check =
						{
							command = "check"
						}
					}
				}
			}
		})
	end
}

local nnoremap = require("keymap").nnoremap

local desc = function(desc)
	if desc then
		desc = "[N]eorg " .. desc
	end
	return { desc = desc }
end

nnoremap("<leader>nm", ":Neorg inject-metadata<CR>", desc("Insert [M]etadata"))
nnoremap("<leader>no", ":Neorg<CR>", desc("[O]org"))

return {
	"nvim-neorg/neorg",
	enabled = false,
	build = ":Neorg sync-parsers",
	opts = {
		load = {
			["core.defaults"] = {}, -- Loads default behaviour
			["core.concealer"] = {}, -- Adds pretty icons to your documents
			["core.dirman"] = { -- Manages Neorg workspaces
				config = {
					workspaces = {
						notes = "~/dev/notes",
					},
				},
			},
		},
	},
	config = function(_, opts)
		require("neorg").setup(opts)
		require("plugin.neorg")
	end,
	dependencies = { { "nvim-lua/plenary.nvim" } },
}

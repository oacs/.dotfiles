return {
	"nvim-neorg/neorg",
	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	version = "*", -- Pin Neorg to the latest stable release
	dependencies = {
		{
			"juniorsundar/neorg-extras",
			-- tag = "v0.3.1" -- Always a safe bet to track current latest release
		},
		"nvim-telescope/telescope.nvim", -- Required for the Neorg-Roam features
		"nvim-lua/plenary.nvim", -- Required as part of Telescope installation
		{ "nvim-neorg/neorg-telescope" },
	},
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.ui.calendar"] = {}, -- Adds pretty icons to your documents
				["core.tangle"] = {},
				["core.journal"] = {
					config = {
						strategy = "flat",
					},
				}, -- Adds pretty icons to your documents
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
				["core.integrations.nvim-cmp"] = {},
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							default = "~/dev/notes",
						},
					},
				},
				["core.integrations.telescope"] = {
					config = {
						insert_file_link = {
							-- Whether to show the title preview in telescope. Affects performance with a large
							-- number of files.
							show_title_preview = true,
						},
					},
				},
				["external.agenda"] = {}, -- OPTIONAL if you don't want the agenda features
				-- MANDATORY and if you're a 50-cent fan
				["external.many-mans"] = {
					config = {
						treesitter_fold = true, -- If you don't want @data property ... @end to fold
					},
				},
			},
		})
		require("neorg.core").modules.get_module("core.dirman").set_workspace("default")

		require("oacs.maps.maps").add_neorg_maps()
	end,
}

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
		"xiyaowong/telescope-emoji.nvim",
		"benfowler/telescope-luasnip.nvim",

		-- Add yanky to copy to system clipboard
		{
			"gbprod/yanky.nvim",
			opts = {},
		},
		"folke/trouble.nvim",
	},
	config = function()
		local actions = require("telescope.actions")
		-- This is your opts table
		local open_with_trouble = require("trouble.sources.telescope").open

		-- Use this to add more results without clearing the trouble list
		local add_to_trouble = require("trouble.sources.telescope").add

		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<c-t>"] = open_with_trouble,
						["<c-T>"] = add_to_trouble,
						["<C-j>"] = actions.cycle_history_next,
						["<C-k>"] = actions.cycle_history_prev,
					},
					n = {
						["<c-t>"] = open_with_trouble,
						["<c-T>"] = add_to_trouble,
						["<C-j>"] = actions.cycle_history_next,
						["<C-k>"] = actions.cycle_history_prev,
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						-- even more opts
					}),
				},
			},
		})
		-- To get ui-select loaded and working with telescope, you need to call
		-- load_extension, somewhere after setup function:
		require("telescope").load_extension("ui-select")
		require("telescope").load_extension("harpoon")
		-- require("telescope").load_extension("dap")
		require("telescope").load_extension("yank_history")
		require("telescope").load_extension("emoji")
		require("telescope").load_extension("luasnip")
		-- Enable telescope fzf native, if installed
		pcall(require("telescope").load_extension, "fzf")
		require("oacs.maps.maps").add_telescope_maps()
	end,
}

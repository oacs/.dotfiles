local o = vim.o

return {
	{
		"folke/which-key.nvim",
		enabled = false,
		config = function()
			o.timeout = true
			o.timeoutlen = 300
			require("which-key").setup({})
		end,
	},

	-- 	-- Coment
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	--
	-- 	-- Delete ( ) [ ] { } without inner content
	{
		"kylechui/nvim-surround",
		opts = {
			keymaps = {
				insert = "<C-g>s",
				insert_line = "<C-g>S",
				normal = "S",
				normal_cur = "Ss",
				normal_line = "SS",
				normal_cur_line = "ySS",
				visual = "S",
				visual_line = "gS",
				delete = "ds",
				change = "cs",
			},
		},
	},
	--
	{
		"liangxianzhe/nap.nvim",
		enabled = false,
		opts = {
			next_repeat = "<c-n><c-n>",
			prev_repeat = "<c-p><c-p>",
		},
	},

	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				delete_to_trash = true,
				skip_confirm_for_simple_edits = true,
				view_options = {
					show_hidden = true,
					natural_order = true,
					is_alway_hidden = function(name, _)
						return name == ".git"
					end,
				},
				win_aptions = {
					wrap = true,
				},
				keymaps = {
					["g?"] = "actions.show_help",
					["<CR>"] = "actions.select",
					["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
					["<C-s>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
					["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
					["<C-p>"] = "actions.preview",
					["<C-c>"] = "actions.close",
					["<C-r>"] = "actions.refresh",
					["-"] = "actions.parent",
					["_"] = "actions.open_cwd",
					["`"] = "actions.cd",
					["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory", mode = "n" },
					["gs"] = "actions.change_sort",
					["gx"] = "actions.open_external",
					["g."] = "actions.toggle_hidden",
					["g\\"] = "actions.toggle_trash",
				},
				use_default_keymaps = false,
			})
		end,
	},

	{ "saadparwaiz1/cmp_luasnip" },
	{ "sindrets/diffview.nvim" },
	{
		"supermaven-inc/supermaven-nvim",
		enabled = true,
		config = function()
			require("supermaven-nvim").setup({})
		end,
	},
	{
		"rest-nvim/rest.nvim",
		enabled = false,
		config = function()
			require("rest-nvim").setup({
				env = {
					enabled = true,
					pattern = "~/workspace/apiCalls/*.env",
				},
			})
			-- require("oacs.maps.maps").add_rest_maps()
		end,
	},
}

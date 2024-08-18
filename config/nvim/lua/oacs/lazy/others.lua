local o = vim.o

return {
	{
		"folke/which-key.nvim",
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
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "┊",
			},
			whitespace = {
				remove_blankline_trail = false,
			},
		},
	},
	--
	{
		"liangxianzhe/nap.nvim",
		opts = {
			next_repeat = "<c-n><c-n>",
			prev_repeat = "<c-p><c-p>",
		},
	},

	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "<CurrentMajor>.*",
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip").filetype_extend("javascript", { "next" })
		end,
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
			})
		end,
	},
}

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
	-- 	{
	-- 		enabled = false,
	-- 		"dstein64/vim-startuptime",
	-- 		-- lazy-load on a command
	-- 		cmd = "StartupTime",
	-- 		-- init is called during startup. Configuration for vim plugins typically should be set in an init function
	-- 		init = function()
	-- 			vim.g.startuptime_tries = 10
	-- 		end,
	-- 	},
	--
	--
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
	-- 	-- prisma '
	-- 	-- "pantharshit00/vim-prisma",
	-- 	{
	-- 		"L3MON4D3/LuaSnip",
	-- 		-- follow latest release.
	-- 		version = "<CurrentMajor>.*",
	-- 		-- install jsregexp (optional!).
	-- 		build = "make install_jsregexp",
	-- 		dependencies = {
	-- 			"rafamadriz/friendly-snippets",
	-- 		},
	-- 		config = function()
	-- 			require("luasnip.loaders.from_vscode").lazy_load()
	-- 			require("luasnip").filetype_extend("javascript", { "next" })
	-- 		end,
	-- 	},
	--
	-- 	-- Copilot
	-- 	--"github/copilot.vim",
	-- 	-- "zbirenbaum/copilot.lua"
	-- 	-- "zbirenbaum/copilot-cmp"
	--
	-- 	--
	-- 	--	"mfussenegger/nvim-dap",
	-- 	--
	-- 	--
	-- 	--	"jay-babu/mason-nvim-dap.nvim",
	-- 	--
	-- 	-- { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } })
	-- 	-- "nvim-telescope/telescope-dap.nvim",
	--
	-- 	-- "lervag/vimtex",
	--
	-- 	{ -- Additional text objects via treesitter
	-- 	enabled = false,
	-- 		"nvim-treesitter/nvim-treesitter-textobjects",
	-- 		after = "nvim-treesitter",
	-- 	},
	-- 	--	"/home/oacs/dev/rocket",
	--
	--
	-- 	-- NOTE: Style and look and feel, bar
	-- 	,
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
	-- 	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	--
	-- 	{
	-- 		"iamcco/markdown-preview.nvim",
	-- 		enabled = false,
	-- 		run = function()
	-- 			vim.fn["mkdp#util#install"]()
	-- 		end,
	-- 	},
	--
	{
		"liangxianzhe/nap.nvim",
		opts = {
			next_repeat = "<c-n><c-n>",
			prev_repeat = "<c-p><c-p>",
		},
	},
	-- 	{
	-- 		"windwp/nvim-autopairs",
	-- 		opts = {
	-- 			disable_filetype = { "TelescopePrompt", "vim" },
	-- 		},
	-- 	},
	-- 	{
	-- 		"zbirenbaum/copilot-cmp",
	-- 		config = function()
	-- 			require("copilot_cmp").setup()
	-- 		end,
	-- 	},
	-- 	{
	-- 		"zbirenbaum/copilot.lua",
	-- 		cmd = "Copilot",
	-- 		event = "InsertEnter",
	-- 		config = function()
	-- 			require("copilot").setup({
	-- 				suggestion = { enabled = false },
	-- 				panel = { enabled = false },
	-- 			})
	-- 		end,
	-- 	},
	-- 	{
	-- 		enabled = false,
	-- 		"dpayne/CodeGPT.nvim",
	-- 		dependencies = {
	-- 			"nvim-lua/plenary.nvim",
	-- 			"MunifTanjim/nui.nvim",
	-- 		},
	-- 		build = "pip install tiktoken",
	-- 		config = function()
	-- 			require("codegpt.config")
	-- 		end,
	-- 	},
	--
	-- 	{
	-- 		"xiyaowong/transparent.nvim",
	-- 		enabled = false,
	-- 		config = function()
	-- 			require("transparent").setup({
	-- 				groups = { -- table: default groups
	-- 					"Normal",
	-- 					"NormalNC",
	-- 					"Comment",
	-- 					"Constant",
	-- 					"Special",
	-- 					"Identifier",
	-- 					"Statement",
	-- 					"PreProc",
	-- 					"Type",
	-- 					"Underlined",
	-- 					"Todo",
	-- 					"String",
	-- 					"Function",
	-- 					"Conditional",
	-- 					"Repeat",
	-- 					"Operator",
	-- 					"Structure",
	-- 					"LineNr",
	-- 					"NonText",
	-- 					"SignColumn",
	-- 					"CursorLineNr",
	-- 					"EndOfBuffer",
	-- 				},
	-- 				extra_groups = {
	-- 					"NvimTreeNormal", -- NvimTree
	-- 				}, -- table: additional groups that should be cleared
	-- 				exclude_groups = {}, -- table: groups you don't want to clear
	-- 			})
	-- 		end,
	-- 	},
}

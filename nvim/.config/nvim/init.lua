-- Install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	},
	{
		"folke/neoconf.nvim",
		cmd = "Neoconf",
	},

	-- Plebvim lsp Plugins
	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",

			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
		},
		config = function()
			require("neodev").setup()
			require("fidget").setup({ text = {
				spinner = "moon",
			} })
			require("neoconf").setup({})
			require("plugin.lsp")
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
			"xiyaowong/telescope-emoji.nvim",
			"benfowler/telescope-luasnip.nvim",
		},
		config = function()
			require("plugin.tmux")
			require("plugin.telescope")
		end,
	},
	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available

	-- Harpoon quick terminal jumps
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("plugin.harpoon")
		end,
	},

	-- Git
	"tpope/vim-fugitive",
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
			})
		end,
	},

	-- Prettier
	"sbdchd/neoformat",

	-- Coment
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- Delete ( ) [ ] { } without inner content
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({
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
			})
		end,
	},

	-- prisma '
	-- "pantharshit00/vim-prisma",
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "<CurrentMajor>.*",
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function() end,
	},
	-- CMP
	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = {
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
		},

		config = function() end,
	},

	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({
				color_icons = true,
				default = true,
			})
		end,
	},

	-- Snippets
	tag = "v<CurrentMajor>.*",
	"rafamadriz/friendly-snippets",

	-- Copilot
	--"github/copilot.vim",
	--"zbirenbaum/copilot.lua"
	--"zbirenbaum/copilot-cmp"

	--
	--	"mfussenegger/nvim-dap",
	--
	--
	--	"jay-babu/mason-nvim-dap.nvim",
	--
	-- { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } })
	-- "nvim-telescope/telescope-dap.nvim",

	-- "lervag/vimtex",

	-- Treesitter
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function() end,
	},

	{ -- Additional text objects via treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	},
	"nvim-treesitter/nvim-treesitter-context",
	--	"/home/oacs/dev/rocket",

	-- Add yanky to copy to system clipboard
	{
		"gbprod/yanky.nvim",
		config = function()
			require("yanky").setup({})
		end,
	},

	-- NOTE: Style and look and feel
	{
		"nvim-lualine/lualine.nvim", -- Fancier statusline

		config = function()
			require("plugin.lualine")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				char = "┊",
				show_trailing_blankline_indent = false,
			})
		end,
	},
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	-- You can alias plugin names
	"dracula/vim",
	-- "sainnhe/gruvbox-material",
	-- "folke/tokyonight.nvim",

	-- {
	--	"iamcco/markdown-preview.nvim",
	--	run = function()
	--		vim.fn["mkdp#util#install"]()
	--	end,
	-- }

	-- "jose-elias-alvarez/null-ls.nvim",
	{
		"liangxianzhe/nap.nvim",
		config = function()
			require("nap").setup({
				next_repeat = "<c-n><c-n>",
				prev_repeat = "<c-p><c-p>",
			})
		end,
	},
	{
		"windwp/nvim-autopairs",

		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "TelescopePrompt", "vim" },
			})
		end,
	},

	"nvim-lua/plenary.nvim",
	"MunifTanjim/nui.nvim",
	"dpayne/CodeGPT.nvim",
})

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Set colorscheme
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.o.syntax = true

-- set color scheme
-- silent to avoid error if theme is missing
-- vim.cmd("silent! colorscheme tokyonight-moon")
vim.cmd("silent! colorscheme dracula")
local main_config_failed, _ = pcall(require, "oacs")
if not main_config_failed then
	print("Failed to load main config")
end

--require("oacs")

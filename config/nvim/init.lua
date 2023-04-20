-- Bootstrap lazy
local opt = vim.opt
local g = vim.g
local o = vim.o

local bootstrap_lazy = function()
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
	opt.rtp:prepend(lazypath)
end

bootstrap_lazy()

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
g.mapleader = " "
g.maplocalleader = " "

require("lazy").setup({
	-- Folke supremacy
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			-- set color scheme
			-- silent to avoid error if theme is missing
			vim.cmd([[silent! colorscheme tokyonight]])
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			o.timeout = true
			o.timeoutlen = 300
			require("which-key").setup({})
		end,
	},
	{
		"folke/neoconf.nvim",
		cmd = "Neoconf",
	},
	{
		"dstein64/vim-startuptime",
		-- lazy-load on a command
		cmd = "StartupTime",
		-- init is called during startup. Configuration for vim plugins typically should be set in an init function
		init = function()
			vim.g.startuptime_tries = 10
		end,
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
	{
		"sbdchd/neoformat",
		config = function()
			g.neoformat_enabled_vue = { "prettierd", "eslint_d" }
			g.neoformat_enabled_javascript = { "prettierd", "eslint_d" }
			g.neoformat_enabled_typescript = { "prettier", "eslint" }
			g.neoformat_enabled_json = { "prettierd" }
			g.neoformat_enabled_go = { "gofmt" }
			g.neoformat_enabled_lua = { "stylua" }
			g.neoformat_enabled_vim = { "prettier" }
			g.neoformat_enabled_prisma = { "prettier" }
			g.neoformat_enabled_shell = { "shmft", "prettierd" }
			g.neoformat_enabled_sh = { "shmft", "prettierd" }
			g.neoformat_run_all_formatters = 1
			g.shfmt_opt = "ci"
			g.neoformat_basic_format_align = 1
			g.neoformat_basic_format_retab = 1
			g.neoformat_basic_format_trim = 1

			vim.api.nvim_create_autocmd({ "BufWritePre" }, {
				pattern = {
					"*.rs",
					"*.astro",
					"*.lua",
					"*.sh",
					"*.ts",
					"*.vue",
					"*.json",
					"*.tsx",
					"*.js",
					"*.html",
				},
				command = "undojoin | Neoformat",
			})
		end,
	},

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
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip").filetype_extend("javascript", { "next" })
		end,
	},
	-- CMP
	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		-- load cmp on InsertEnter
		event = "InsertEnter",
		dependencies = {
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
		},

		config = function()
			require("plugin.cmp")
		end,
	},

	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
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
		dependencies = {

			"nvim-treesitter/nvim-treesitter-context",
		},
		build = ":TSUpdate",
		config = function()
			require("plugin.treesitter")
		end,
	},

	{ -- Additional text objects via treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	},
	--	"/home/oacs/dev/rocket",

	-- Add yanky to copy to system clipboard
	{
		"gbprod/yanky.nvim",
		opts = {},
	},

	-- NOTE: Style and look and feel
	{
		"nvim-lualine/lualine.nvim", -- Fancier statusline
		opts = {
			options = {
				theme = "tokyonight",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "filename" },
				lualine_c = { "diff", "diagnostics" },
				lualine_x = { "encoding" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			char = "┊",
			show_trailing_blankline_indent = false,
		},
	},
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	{
		"iamcco/markdown-preview.nvim",
		enabled = false,
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- "jose-elias-alvarez/null-ls.nvim",
	{
		"liangxianzhe/nap.nvim",
		opts = {
			next_repeat = "<c-n><c-n>",
			prev_repeat = "<c-p><c-p>",
		},
	},
	{
		"windwp/nvim-autopairs",
		opts = {
			disable_filetype = { "TelescopePrompt", "vim" },
		},
	},

	"MunifTanjim/nui.nvim",
	"dpayne/CodeGPT.nvim",
})

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
o.mouse = "a"

-- Enable break indent
o.breakindent = true

-- Save undo history
o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Decrease update time
o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Set colorscheme
o.termguicolors = true

-- Set completeopt to have a better completion experience
o.completeopt = "menuone,noselect"

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

o.syntax = "ON"

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2
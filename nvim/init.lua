-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Plebvim lsp Plugins
	use({ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		requires = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",

			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
		},
	})

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.X",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable("make") == 1 })
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use("xiyaowong/telescope-emoji.nvim")

	-- Harpoon quick terminal jumps
	use("ThePrimeagen/harpoon")

	-- Git
	use({ "tpope/vim-fugitive" })
	use({
		"lewis6991/gitsigns.nvim",
	})

	-- Prettier
	use({ "sbdchd/neoformat" })

	-- Coment
	use({
		"numToStr/Comment.nvim",
	})

	-- Delete ( ) [ ] { } without inner content
	use({ "kylechui/nvim-surround" })

	-- prisma '
	use("pantharshit00/vim-prisma")
	use("j-hui/fidget.nvim")

	-- CMP
	use({ -- Autocompletion
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
	})

	use("onsails/lspkind.nvim")

	use("nvim-tree/nvim-web-devicons")

	-- Snippets
	use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" })
	use("rafamadriz/friendly-snippets")

	-- Copilot
	-- use("github/copilot.vim")
	use("zbirenbaum/copilot.lua", {})
	use("zbirenbaum/copilot-cmp", {})

	-- Treesitter
	use({ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		run = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	})

	use({ -- Additional text objects via treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	})
	--	use("/home/oacs/dev/rocket")

	-- Add yanky to copy to system clipboard
	use("gbprod/yanky.nvim")

	-- NOTE: Style and look and feel
	use("nvim-lualine/lualine.nvim") -- Fancier statusline
	use("lukas-reineke/indent-blankline.nvim")
	use("tpope/vim-sleuth") -- Detect tabstop and shiftwidth automatically
	-- You can alias plugin names
	-- use({ "dracula/vim", as = "dracula" })
	use({ "sainnhe/gruvbox-material" })
	use("folke/tokyonight.nvim")

	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	-- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
	local has_plugins, plugins = pcall(require, "custom.plugins")
	if has_plugins then
		plugins(use)
	end

	if is_bootstrap then
		require("packer").sync()
	end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
	print("==================================")
	print("    Plugins are being installed")
	print("    Wait until Packer completes,")
	print("       then restart nvim")
	print("==================================")
	return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | silent! LspStop | silent! LspStart | PackerCompile",
	group = packer_group,
	pattern = vim.fn.expand("$MYVIMRC"),
})
-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

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

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- use space as a the leader key

vim.o.syntax = true

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*.astro", "*.lua", "*.sh", "*.ts", "*.vue", "*.json", "*.tsx", "*.js", "*.html" },
	command = ":Format",
})
-- set color scheme
-- silent to avoid error if theme is missing
vim.cmd("silent! colorscheme tokyonight-moon")
local _, _ = pcall(require, "oacs")
--require("oacs")

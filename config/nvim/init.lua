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
			-- g.neoformat_enabled_vue = { "prettierd", "eslint_d" }
			-- g.neoformat_enabled_javascript = { "prettierd", "eslint_d" }
			-- g.neoformat_enabled_typescript = { "prettier", "eslint" }
			-- g.neoformat_enabled_json = { "prettierd" }
			-- g.neoformat_enabled_go = { "gofmt" }
			-- g.neoformat_enabled_lua = { "stylua" }
			-- g.neoformat_enabled_vim = { "prettier" }
			-- g.neoformat_enabled_prisma = { "prettier" }
			-- g.neoformat_enabled_shell = { "shmft", "prettierd" }
			-- g.neoformat_enabled_sh = { "shmft", "prettierd" }
			-- g.neoformat_run_all_formatters = 1
			-- g.shfmt_opt = "ci"
			-- g.neoformat_basic_format_align = 1
			-- g.neoformat_basic_format_retab = 1
			-- g.neoformat_basic_format_trim = 1

			vim.api.nvim_create_autocmd({ "BufWritePre" }, {
				pattern = {
					"*.lua",
				},
				command = "Neoformat stylua",
			})
			vim.api.nvim_create_autocmd({ "BufWritePre" }, {
				pattern = {
					"*.ts",
					"*.vue",
					"*.json",
					"*.tsx",
					"*.js",
					"*.jsx",
					"*.css",
					"*.scss",
					"*.sass",
					"*.html",
				},
				command = "Neoformat prettier",
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
			"nvim-treesitter/playground",
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

	-- NOTE: Style and look and feel, bar
	{
		"nvim-lualine/lualine.nvim", -- Fancier statusline
		config = function()
			local CodeGPTModule = require("codegpt")
			require("lualine").setup({
				options = {
					theme = "tokyonight",
				},
				extensions = {
					"fugitive",
					"lazy",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "filename", "FugitiveHead" },
					lualine_c = { "diff", "diagnostics" },
					lualine_x = { CodeGPTModule.get_status, "encoding" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			})
		end,
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

	{
		"dpayne/CodeGPT.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		build = "pip install tiktoken",
		config = function()
			require("codegpt.config")
		end,
	},

	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({
				groups = { -- table: default groups
					"Normal",
					"NormalNC",
					"Comment",
					"Constant",
					"Special",
					"Identifier",
					"Statement",
					"PreProc",
					"Type",
					"Underlined",
					"Todo",
					"String",
					"Function",
					"Conditional",
					"Repeat",
					"Operator",
					"Structure",
					"LineNr",
					"NonText",
					"SignColumn",
					"CursorLineNr",
					"EndOfBuffer",
				},
				extra_groups = {
					"NvimTreeNormal", -- NvimTree
				}, -- table: additional groups that should be cleared
				exclude_groups = {}, -- table: groups you don't want to clear
			})
		end,
	},
	{
		"nvim-neorg/neorg",
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
	},
	{
		"epwalsh/obsidian.nvim",
		-- lazy = true,
		-- event = { "BufReadPre ~/dev/notes/**.md" },
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
		-- event = { "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",
			-- Optional, alternative to nvim-treesitter for syntax highlighting.
			"godlygeek/tabular",
			"preservim/vim-markdown",
		},
		opts = {
			dir = "~/dev/notes", -- no need to call 'vim.fn.expand' here

			-- Optional, if you keep notes in a specific subdirectory of your vault.
			notes_subdir = "slipbox",

			-- Optional, if you keep daily notes in a separate directory.
			daily_notes = {
				folder = "dailies",
			},
			-- Optional, completion.
			completion = {
				nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
			},

			-- Optional, customize how names/IDs for new notes are created.
			note_id_func = function(title)
				-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
				-- In this case a note with the title 'My new note' will given an ID that looks
				-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
				local suffix = ""
				if title ~= nil then
					-- If title is given, transform it into valid file name.
					suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					-- If title is nil, just add 4 random uppercase letters to the suffix.
					for _ = 1, 4 do
						suffix = suffix .. string.char(math.random(65, 90))
					end
				end
				return tostring(os.time()) .. "-" .. suffix
			end,

			-- Optional, set to true if you don't want Obsidian to manage frontmatter.
			disable_frontmatter = false,

			-- Optional, alternatively you can customize the frontmatter data.
			note_frontmatter_func = function(note)
				-- This is equivalent to the default frontmatter function.
				local out = { id = note.id, aliases = note.aliases, tags = note.tags }
				-- `note.metadata` contains any manually added fields in the frontmatter.
				-- So here we just make sure those fields are kept in the frontmatter.
				if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
					for k, v in pairs(note.metadata) do
						out[k] = v
					end
				end
				return out
			end,

			-- Optional, for templates (see below).
			templates = {
				subdir = "templates",
				date_format = "%Y-%m-%d-%a",
				time_format = "%H:%M",
			},

			-- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
			-- URL it will be ignored but you can customize this behavior here.
			follow_url_func = function(url)
				-- Open the URL in the default web browser.
				vim.fn.jobstart({ "open", url }) -- Mac OS
				-- vim.fn.jobstart({"xdg-open", url})  -- linux
			end,

			-- Optional, set to true if you use the Obsidian Advanced URI plugin.
			-- https://github.com/Vinzent03/obsidian-advanced-uri
			use_advanced_uri = true,

			-- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
			open_app_foreground = false,
		},
		config = function(_, opts)
			require("obsidian").setup(opts)

			-- Optional, override the 'gf' keymap to utilize Obsidian's search functionality.
			-- see also: 'follow_url_func' config option above.
			vim.keymap.set("n", "gf", function()
				if require("obsidian").util.cursor_on_markdown_link() then
					return "<cmd>ObsidianFollowLink<CR>"
				else
					return "gf"
				end
			end, { noremap = false, expr = true })
		end,
	},
})

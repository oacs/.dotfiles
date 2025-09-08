-- [[ Setting options ]]
local o = vim.o
local opt = vim.opt
-- local wo = vim.wo
local g = vim.g

-- opt.listchars = "eol:↲,tab:\\x20\\x20"
-- opt.list = true
opt.swapfile = false

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
o.syntax = "ON"

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

o.number = true
o.numberwidth = 1
o.clipboard = o.clipboard .. "unnamedplus"
o.showcmd = true
o.ruler = true
o.encoding = "UTF-8"
o.showmatch = true
o.relativenumber = true
o.laststatus = 2
g.showmode = false
o.ts = 2
o.sts = 2
o.et = true
o.hidden = true

-- o.foldmethod = "manual"
-- o.foldexpr = "nvim_treesitter#foldexpr()"
opt.fillchars = { fold = " " }
opt.foldmethod = "indent"
opt.foldenable = false
opt.foldlevel = 5
g.markdown_folding = 1 -- enable markdown folding

o.fml = 16

g.dashboard_default_executive = "telescope"
-- CMP config
g.completeopt = "menu,menuone,noselect"

-- Obsidian
opt.conceallevel = 2

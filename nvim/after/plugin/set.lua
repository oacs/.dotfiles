local o = vim.o
-- local wo = vim.wo
local g = vim.g

o.number = true
o.mouse = "a"
o.numberwidth = 1
o.clipboard = "unnamedplus"
o.showcmd = true
o.ruler = true
o.encoding = "UTF-8"
o.showmatch = true
o.relativenumber = true
o.laststatus = 2
g.showmode = false
o.ts = 2
o.sts = 2
o.ignorecase = true
o.et = true
o.hidden = true
o.foldmethod = "manual"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.fml = 16

g.dashboard_default_executive = "telescope"
g.completeopt = "menu,menuone,noselect"

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
o.updatetime = 50

-- npm install -g @fsouza/prettierd
g.neoformat_enabled_vue = { "prettierd", "eslint_d" }
g.neoformat_enabled_javascript = { "prettierd" }
g.neoformat_enabled_typescript = { "eslint_d" }
g.neoformat_enabled_json = { "prettierd" }

-- https://pkg.go.dev/cmd/gofmt
g.neoformat_enabled_go = { "gofmt" }

g.neoformat_enabled_lua = { "stylua" }

g.neoformat_enabled_vim = { "prettier" }

-- go install mvdan.cc/sh/v3/cmd/shfmt@latest
g.neoformat_enabled_shell = { "shmft", "prettierd" }
g.neoformat_enabled_sh = { "shmft", "prettierd" }
g.neoformat_run_all_formatters = 1
g.shfmt_opt = "ci"

g.neoformat_basic_format_align = 1
g.neoformat_basic_format_retab = 1
g.neoformat_basic_format_trim = 1
require("nvim-tree").setup()

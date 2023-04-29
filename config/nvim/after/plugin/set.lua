local o = vim.o
-- local wo = vim.wo
local g = vim.g

o.number = true
o.mouse = "a"
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
o.ignorecase = true
o.et = true
o.hidden = true
o.foldmethod = "manual"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.fml = 16

g.dashboard_default_executive = "telescope"
-- CMP config
g.completeopt = "menu,menuone,noselect"

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
o.updatetime = 50

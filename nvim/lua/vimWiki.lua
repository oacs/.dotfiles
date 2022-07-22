local o = vim.o
-- local wo = vim.wo
local g = vim.g

-- Vimwiki
o.nocompatible = true
o.filetype = "plugin"
o.syntax = true
-- Settings for Vimwiki
g.vimwiki_list = { { path = "~/notes/content", ext = ".md", syntax = "markdown" } }
g.zettel_options =
	{ { front_matter = { { "tags", "" }, { "type", "note" } }, template = "~/.dotfiles/zettel_template.tpl" } }
g.zettel_format = "%y%m%d-%H%M-%title"

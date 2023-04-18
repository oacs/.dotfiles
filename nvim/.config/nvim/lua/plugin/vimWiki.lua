-- deprecated plugin
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
g.vimwiki_key_mappings = {
	all_maps = 0,
	global = 0,
	headers = 0,
	text_objs = 0,
	table_format = 0,
	table_mappings = 0,
	lists = 0,
	links = 0,
	html = 0,
	mouse = 0,
}

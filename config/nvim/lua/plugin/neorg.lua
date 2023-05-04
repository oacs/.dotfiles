local nnoremap = require("keymap").nnoremap

local desc = function(desc)
	if desc then
		desc = "[N]eorg " .. desc
	end
	return { desc = desc }
end

nnoremap("<leader>nm", ":Neorg inject-metadata<CR>", desc("Insert [M]etadata"))
nnoremap("<leader>no", ":Neorg<CR>", desc("[O]org"))

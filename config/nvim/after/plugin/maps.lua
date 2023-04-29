local nnoremap = require("keymap").nnoremap
local vnoremap = require("keymap").vnoremap
local tnoremap = require("keymap").tnoremap
local xnoremap = require("keymap").xnoremap
local inoremap = require("keymap").inoremap

inoremap("<C-h>", "<C-[>")
nnoremap("<C-t>", ":tabnew<CR>")

nnoremap("<Leader>q", ":q<CR>")
nnoremap("<Leader>w", ":w<CR>")
nnoremap("<Leader><C-w>", ":wq<CR>")
nnoremap("<Leader>l", "<C-w>")
-- nnoremap("<Leader>cp", ":let @* =', 'expand(\"%\")<CR>")
nnoremap("<Leader>e", ":Explore<CR>")
tnoremap("hh", "<C-\\><C-n>")
tnoremap("<C-h>", "<C-\\><C-n>")
vnoremap("//", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>")
xnoremap("<leader>p", '"_dP')
-- nnoremap("<F5>", ":UndotreeToggle<CR>")
-- map <C-L> (redraw screen) to also turn off search highlighting until the
-- next search
nnoremap("<C-L>", ":nohl<CR><C-L>")

-- greatest remap ever
xnoremap("<leader>p", '"_dP')

-- next greatest remap ever : asbjornHaland
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')
nnoremap("<leader>Y", 'gg"+yG')

nnoremap("<leader>d", '"_d')
vnoremap("<leader>d", '"_d')

nnoremap("<Leader>o", ":SymbolsOutline<CR>")

local nnoremap = require("keymap").nnoremap
local vnoremap = require("keymap").vnoremap
local tnoremap = require("keymap").tnoremap
local xnoremap = require("keymap").xnoremap
local inoremap = require("keymap").inoremap

nnoremap("<Leader>q", ":q<CR>")
nnoremap("<Leader>w", ":w<CR>")
nnoremap("<Leader>l", "<C-w>")
nnoremap("<Leader>cp", ":let @* =', 'expand(\"%\")<CR>")
--nnoremap("<Leader>bp", ":bp<CR>")
--nnoremap("<Leader>bb", ":buffers<CR>")
--nnoremap("<Leader>bd", ":bd<CR>")
--nnoremap("<Leader>bw", ":bw<CR>")
--nnoremap("<Leader>bn", ":bn<CR>")
--nnoremap("<Leader>l", ":bn<CR>")
nnoremap("<Leader>e", ":NnnExplorer<CR>")
tnoremap("hh", "<C-\\><C-n>")
vnoremap("//", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>")
xnoremap("<leader>p", '"_dP')
nnoremap("<F5>", ":UndotreeToggle<CR>")
-- map <C-L> (redraw screen) to also turn off search highlighting until the
-- next search
nnoremap("<C-L>", ":nohl<CR><C-L>")
-- Don't use arrow keys
--[[ map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>") ]]
-- Easy quick of insert mode
inoremap("hh", "<Esc>")

-- map("", "<Leader>e", "<cmd>lua require('lf').start()<CR>")

-- greatest remap ever
xnoremap("<leader>p", '"_dP')

-- next greatest remap ever : asbjornHaland
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')
nnoremap("<leader>Y", 'gg"+yG')

nnoremap("<leader>d", '"_d')
vnoremap("<leader>d", '"_d')

nnoremap("<Leader>o", ":SymbolsOutline<CR>")

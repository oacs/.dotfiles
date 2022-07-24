local nnoremap = require("keymap").nnoremap

nnoremap("<leader>gg", ":G<CR>")
nnoremap("<leader>gp", ":G push<CR>")
nnoremap("<leader>gP", ":G push -f<CR>")
nnoremap("<leader>gu", ":G pull<CR>")
nnoremap("<leader>gk", ":Gfetch<CR>")
nnoremap("<leader>gc", ":G checkout -b ")
nnoremap("<leader>gn", ":diffget //3<CR>")
nnoremap("<leader>go", ":diffget //2<CR>")

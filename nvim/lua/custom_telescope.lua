local M = {}
M.search_todos = function()
        require('telescope.builtin').grep_string({
                use_regex = true,
                search = "[T|t][O|o][D|d][O|o]([S|s]?)|(@?[O|o][A|a][C|c][S|s])"
       })
end
-- todo
-- oacs
-- @oacs
-- Todo
-- TOdo
-- TODo
-- TODO

return M

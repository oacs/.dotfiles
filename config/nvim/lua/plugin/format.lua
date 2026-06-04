local M = {}

-- Format the current visual selection (whole lines) by piping it through
-- prettier with the given parser, preserving the first line's leading indent.
local function format_range(parser)
	local srow = vim.fn.line("'<")
	local erow = vim.fn.line("'>")
	if srow > erow then
		srow, erow = erow, srow
	end

	local lines = vim.api.nvim_buf_get_lines(0, srow - 1, erow, false)
	if #lines == 0 then
		return
	end
	local input = table.concat(lines, "\n")

	-- preserve the selection's leading indent (query usually nested in a string/body)
	local indent = lines[1]:match("^%s*") or ""

	local prettier = vim.fn.exepath("prettier")
	if prettier == "" then
		prettier = vim.fn.stdpath("data") .. "/mason/bin/prettier"
	end

	local res = vim.system({ prettier, "--parser", parser }, { stdin = input, text = true }):wait()

	if res.code ~= 0 then
		vim.notify(parser .. " format failed: " .. (res.stderr or ""), vim.log.levels.ERROR)
		return
	end

	local formatted = vim.split(vim.trim(res.stdout), "\n")
	if indent ~= "" then
		for i, l in ipairs(formatted) do
			formatted[i] = (l == "") and "" or (indent .. l)
		end
	end

	vim.api.nvim_buf_set_lines(0, srow - 1, erow, false, formatted)
end

function M.format_selection()
	format_range("graphql")
end

function M.format_json()
	format_range("json")
end

return M

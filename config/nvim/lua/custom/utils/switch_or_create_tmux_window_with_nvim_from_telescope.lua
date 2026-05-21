return setmetatable({
	history = [==[ [
  {
    "description": "",
    "implementation": "return function(opts)\n  -- Switch to named tmux window or open new one with nvim at selected dir\n  local path = vim.fn.expand((opts and opts.path) or \".\")\n  local Job = require(\"plenary.job\")\n  local scan = require(\"plenary.scandir\")\n  local pickers = require(\"telescope.pickers\")\n  local finders = require(\"telescope.finders\")\n  local conf = require(\"telescope.config\").values\n  local actions = require(\"telescope.actions\")\n  local action_state = require(\"telescope.actions.state\")\n\n  local dirs = scan.scan_dir(path, { depth = 1, only_dirs = true })\n\n  pickers.new(opts or {}, {\n    prompt_title = \"Tmux Windows\",\n    finder = finders.new_table({\n      results = dirs,\n      entry_maker = function(entry)\n        local name = vim.fn.fnamemodify(entry, \":t\")\n        return { value = entry, display = name, ordinal = name }\n      end,\n    }),\n    sorter = conf.generic_sorter(opts or {}),\n    attach_mappings = function(prompt_bufnr)\n      actions.select_default:replace(function()\n        actions.close(prompt_bufnr)\n        local sel = action_state.get_selected_entry()\n        if not sel then return end\n        local dir = sel.value\n        local winname = vim.fn.fnamemodify(dir, \":t\")\n        local err = 0\n        Job:new({\n          command = \"tmux\",\n          args = { \"select-window\", \"-t\", \":=\" .. winname },\n          cwd = vim.uv.cwd(),\n          on_stderr = function() err = 1 end,\n        }):sync()\n        if err == 1 then\n          Job:new({\n            command = \"tmux\",\n            args = { \"new-window\", \"-n\", winname, \"-c\", dir, \"nvim\" },\n            cwd = vim.uv.cwd(),\n          }):sync()\n        end\n      end)\n      return true\n    end,\n  }):find()\nend",
    "option_example": {
      "path": "~/workspace/"
    },
    "option_list": "path"
  },
  {
    "description": "The function should also make sure to:\nthe nvim needs to be started like `nvim .` and the tmux windown should be named the same as the folder that we openned",
    "implementation": "return function(opts)\n  -- Switch to named tmux window or open new one with `nvim .` at selected dir\n  local path = vim.fn.expand((opts and opts.path) or \".\")\n  local Job = require(\"plenary.job\")\n  local scan = require(\"plenary.scandir\")\n  local pickers = require(\"telescope.pickers\")\n  local finders = require(\"telescope.finders\")\n  local conf = require(\"telescope.config\").values\n  local actions = require(\"telescope.actions\")\n  local action_state = require(\"telescope.actions.state\")\n\n  local dirs = scan.scan_dir(path, { depth = 1, only_dirs = true })\n\n  pickers.new(opts or {}, {\n    prompt_title = \"Tmux Windows\",\n    finder = finders.new_table({\n      results = dirs,\n      entry_maker = function(entry)\n        local name = vim.fn.fnamemodify(entry, \":t\")\n        return { value = entry, display = name, ordinal = name }\n      end,\n    }),\n    sorter = conf.generic_sorter(opts or {}),\n    attach_mappings = function(prompt_bufnr)\n      actions.select_default:replace(function()\n        actions.close(prompt_bufnr)\n        local sel = action_state.get_selected_entry()\n        if not sel then return end\n        local dir = sel.value\n        local winname = vim.fn.fnamemodify(dir, \":t\")\n        local err = 0\n        Job:new({\n          command = \"tmux\",\n          args = { \"select-window\", \"-t\", \":=\" .. winname },\n          cwd = vim.uv.cwd(),\n          on_stderr = function() err = 1 end,\n        }):sync()\n        if err == 1 then\n          Job:new({\n            command = \"tmux\",\n            args = { \"new-window\", \"-n\", winname, \"-c\", dir, \"nvim\", \".\" },\n            cwd = vim.uv.cwd(),\n          }):sync()\n        end\n      end)\n      return true\n    end,\n  }):find()\nend",
    "option_example": {
      "path": "~/workspace/"
    },
    "option_list": "path"
  },
  {
    "description": "The function should also make sure to:\nif another window it's already there we switch to that one instead of creating a new one",
    "implementation": "return function(opts)\n  -- Switch to named tmux window or open new one with `nvim .` at selected dir\n  local path = vim.fn.expand((opts and opts.path) or \".\")\n  local Job = require(\"plenary.job\")\n  local scan = require(\"plenary.scandir\")\n  local pickers = require(\"telescope.pickers\")\n  local finders = require(\"telescope.finders\")\n  local conf = require(\"telescope.config\").values\n  local actions = require(\"telescope.actions\")\n  local action_state = require(\"telescope.actions.state\")\n\n  local dirs = scan.scan_dir(path, { depth = 1, only_dirs = true })\n\n  pickers.new(opts or {}, {\n    prompt_title = \"Tmux Windows\",\n    finder = finders.new_table({\n      results = dirs,\n      entry_maker = function(entry)\n        local name = vim.fn.fnamemodify(entry, \":t\")\n        return { value = entry, display = name, ordinal = name }\n      end,\n    }),\n    sorter = conf.generic_sorter(opts or {}),\n    attach_mappings = function(prompt_bufnr)\n      actions.select_default:replace(function()\n        actions.close(prompt_bufnr)\n        local sel = action_state.get_selected_entry()\n        if not sel then return end\n        local dir = sel.value\n        local winname = vim.fn.fnamemodify(dir, \":t\")\n        -- non-zero exit code means window absent, create it\n        local _, code = Job:new({\n          command = \"tmux\",\n          args = { \"select-window\", \"-t\", \":=\" .. winname },\n        }):sync()\n        if code ~= 0 then\n          Job:new({\n            command = \"tmux\",\n            args = { \"new-window\", \"-n\", winname, \"-c\", dir, \"nvim\", \".\" },\n          }):sync()\n        end\n      end)\n      return true\n    end,\n  }):find()\nend",
    "option_example": "{\"path\":\"~/workspace/\"}",
    "option_list": "path"
  }
] ]==],
	implementation = function()
		return function(opts)
			-- Switch to named tmux window or open new one with `nvim .` at selected dir
			local path = vim.fn.expand((opts and opts.path) or ".")
			local Job = require("plenary.job")
			local scan = require("plenary.scandir")
			local pickers = require("telescope.pickers")
			local finders = require("telescope.finders")
			local conf = require("telescope.config").values
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")

			local dirs = scan.scan_dir(path, { depth = 1, only_dirs = true })

			pickers
				.new(opts or {}, {
					prompt_title = "Tmux Windows",
					finder = finders.new_table({
						results = dirs,
						entry_maker = function(entry)
							local name = vim.fn.fnamemodify(entry, ":t")
							return { value = entry, display = name, ordinal = name }
						end,
					}),
					sorter = conf.generic_sorter(opts or {}),
					attach_mappings = function(prompt_bufnr)
						actions.select_default:replace(function()
							actions.close(prompt_bufnr)
							local sel = action_state.get_selected_entry()
							if not sel then
								return
							end
							local dir = sel.value
							local winname = vim.fn.fnamemodify(dir, ":t")
							-- non-zero exit code means window absent, create it
							local _, code = Job:new({
								command = "tmux",
								args = { "select-window", "-t", ":=" .. winname },
							}):sync()
							if code ~= 0 then
								Job:new({
									command = "tmux",
									args = { "new-window", "-n", winname, "-c", dir, "nvim", "." },
								}):sync()
							end
						end)
						return true
					end,
				})
				:find()
		end
	end,
}, {
	__call = function(self, ...)
		return self.implementation()(...)
	end,
})

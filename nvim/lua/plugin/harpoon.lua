require("harpoon").setup({
	global_settings = {
		save_on_toggle = false,
		save_on_change = true,
	},
	projects = {
		-- Yes $HOME works
		["$HOME/dev/admin-portal"] = {
			term = {
				cmds = {
					"./frontend && npm start\n",
					"./backend && npm run start:ubuntu\n",
				},
			},
		},
		["$HOME/dev/front"] = {
			term = {
				cmds = {
					"npm run dev:broker:local\n",
				},
			},
		},
		["$HOME/dev/back"] = {
			term = {
				cmds = {
					"npm run start\n",
					"npm run validate && npm run lint-fix\n",
				},
			},
		},
	},
})

require("harpoon").setup({
	global_settings = {
		save_on_toggle = false,
		save_on_change = true,
	},
	projects = {
		-- Yes $HOME works
		["$HOME/dev/admin-portal"] = {
			term = {
				cmds = {
					"./frontend && npm start\n",
					"./backend && npm run start:ubuntu\n",
				},
			},
		},
		["$HOME/dev/front"] = {
			term = {
				cmds = {
					"npm run dev:broker:local\n",
				},
			},
		},
		["$HOME/dev/back"] = {
			term = {
				cmds = {
					"npm run start\n",
					"npm run validate && npm run lint-fix\n",
				},
			},
		},
	},
})

require("neorg").setup({
  load = {
	["core.defaults"] = {},
	["core.export"] = {},
	["core.concealer"] = {},
	["core.autocommands"] = {},
	["core.integrations.image"] = {},
	["core.integrations.coq_nvim"] = {},
	["core.integrations.telescope"] = {
        config = {
            insert_file_link = {
                show_title_preview = true,
            },
        }
    },
	["core.pivot"] = {},
	["core.latex.renderer"] = {
		config = {
			conceal = true,
			render_on_enter = true,
			dpi = 450,
			scale = 1,
		},
	},
	--["core.completion"] = {
	--	config = {
	--	  engine = "coq_nvim",
	--	},
	--},
	["core.integrations.treesitter"] = {
		config = {
			install_parsers = false;
		},
	},
	["core.dirman"] = {
		config = {
			workspaces = {
				uni = "~/Documents/Uni",
				hamradio = "~/Documents/Amateurfunk/",
			},
		},
	},
  }
})

-- keybindings
vim.keymap.set("n", "<C-t>", "<Plug>(neorg.qol.todo-items.todo.task-cycle)", {})
vim.keymap.set("n", "<C-CR>", "<Plug>(neorg.esupports.hop.hop-link)", {})

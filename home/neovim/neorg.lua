require("neorg").setup({
  load = {
	["core.defaults"] = {},
	["core.concealer"] = {},
	["core.autocommands"] = {},
	["core.integrations.image"] = {},
	["core.integrations.coq_nvim"] = {},
	["core.latex.renderer"] = {
		config = {
			conceal = true,
			render_on_enter = true,
			dpi = 600,
			scale = 1.25,
		},
	},
	["core.completion"] = {
		config = {
		  engine = "coq_nvim",
		},
	},
	["core.integrations.treesitter"] = {
		config = {
			install_parsers = false;
		},
	},
	["core.dirman"] = {
		config = {
			workspaces = {
				uni = "~/Documents/Uni",
			},
		},
	},
  }
})

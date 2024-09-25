vim.opt_local.conceallevel = 2 -- image rendering

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
			dpi = 450,
			scale = 1,
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

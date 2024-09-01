require("neorg").setup({
  load = {
	["core.defaults"] = {},
	["core.concealer"] = {},
	["core.dirman"] = {
		config = {
			workspaces = {
				uni = "~/Documents/Uni",
			},
		},
	},
  }
})

vim.g.coq_settings = {
	display = {
		ghost_text = {
			enabled = false,
		},

		pum = {
			source_context = { "", "" },
		},

		preview = {
			x_max_len = 120,
		},
	},
}

local coq = require("coq")

vim.g.coq_settings = {
	auto_start = false,
	display = {
		statusline = {
			helo = false,
		},
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

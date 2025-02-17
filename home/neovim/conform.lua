require("conform").setup({
	formatters_by_ft = {
		python = { "isort", "black" },
		javascript = { "prettierd" },
		markdown = { "prettierd" },
		nix = { "nixfmt" },
		tex = { "latexindent" },
		rust = { "rustfmt" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

require("conform").format({ async = true, lsp_fallback = true, range = range, stop_after_first = true; })


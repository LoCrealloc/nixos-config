require("conform").setup({
	formatters_by_ft = {
		python = { "isort", "black" },
		javascript = { "prettierd" },
		markdown = { "prettierd" },
		nix = { "nixfmt" },
		tex = { "latexindent" },
		rust = { "rustfmt" },
		bib = { "biber" },
		lua = { "stylua" },
	},
	format_on_save = {
		timeout_ms = 1000,
		lsp_fallback = true,
	},
	formatters = {
		biber = {
			command = "biber",
			stdin = false,
			args = {
				"--tool",
				"--output_align",
				"--output_indent=2",
				"--output_fieldcase=lower",
				"--output-file",
				"$FILENAME",
				"$FILENAME",
			},
		},
	},
})

require("conform").format({ async = true, lsp_fallback = true, range = range, stop_after_first = true })

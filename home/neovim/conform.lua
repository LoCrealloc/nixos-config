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
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_format = "fallback" }
	end,
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

vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

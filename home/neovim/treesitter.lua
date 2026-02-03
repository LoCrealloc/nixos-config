vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"nix",
		"python",
		"c",
		"bash",
		"ld",
		"markdown",
		"tex",
		"bib",
		"dockerfile",
		"lua",
		"haskell",
		"java",
		"rust",
		"asm",
		"gitignore",
		"json",
		"yaml",
		"html",
		"javascript",
		"typescript",
		"svelte",
		"css",
		"vim",
		"tf",
	},
	callback = function()
		vim.treesitter.start()
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo.foldmethod = "expr"

		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 99
	end,
})

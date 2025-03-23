-- Haskell, Nix
vim.api.nvim_create_autocmd(
	{"BufRead", "BufNewFile", "BufEnter"},
	{
		pattern={"*.hs", "*.nix"}, 
		callback=function() 
			vim.api.nvim_set_option_value("expandtab", true, {})
			vim.api.nvim_set_option_value("tabstop", 2, {})
		end
	}
)

vim.api.nvim_create_autocmd(
	"BufLeave",
	{
		pattern={"*.hs", "*.nix"}, 
		callback=function() 
			vim.api.nvim_set_option_value("expandtab", false, {})
			vim.api.nvim_set_option_value("tabstop", 4, {})
		end
	}
)


-- Hugo Markdown
vim.api.nvim_create_autocmd(
	{"BufRead", "BufNewFile", "BufEnter"},
	{
		pattern={"_index.md"}, 
		callback=function() 
			vim.api.nvim_set_option_value("expandtab", true, {})
			vim.api.nvim_set_option_value("tabstop", 2, {})
		end
	}
)

vim.api.nvim_create_autocmd(
	"BufLeave",
	{
		pattern={"_index.md"}, 
		callback=function() 
			vim.api.nvim_set_option_value("expandtab", false, {})
			vim.api.nvim_set_option_value("tabstop", 4, {})
		end
	}
)

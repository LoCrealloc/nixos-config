-- Haskell, Nix
vim.api.nvim_create_autocmd(
	{"BufRead", "BufNewFile"},
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

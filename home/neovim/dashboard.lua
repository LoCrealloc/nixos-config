require("dashboard").setup({
	theme = "doom", --  theme is doom and hyper default is hyper
	disable_move = true, --  default is false disable move keymap for hyper
	-- shortcut_type   --  shorcut type 'letter' or 'number'
	-- shuffle_letter  --  default is true, shortcut 'letter' will be randomize, set to false to have ordered letter.
	change_to_vcs_root = true, -- default is false,for open file in hyper mru. it will change to the root of vcs
	config = {
		header = {
			-- I know that this looks really distorted but I had to take care of the backslashes
			"",
			"",
			"",
			"",
			"      ___           ___           ___                                     ___     ",
			"     /\\  \\         /\\__\\         /\\  \\          ___                      /\\  \\    ",
			"     \\:\\  \\       /:/ _/_       /::\\  \\        /\\  \\        ___         |::\\  \\   ",
			"      \\:\\  \\     /:/ /\\__\\     /:/\\:\\  \\       \\:\\  \\      /\\__\\        |:|:\\  \\  ",
			"  _____\\:\\  \\   /:/ /:/ _/_   /:/  \\:\\  \\       \\:\\  \\    /:/__/      __|:|\\:\\  \\ ",
			" /::::::::\\__\\ /:/_/:/ /\\__\\ /:/__/ \\:\\__\\  ___  \\:\\__\\  /::\\  \\     /::::|_\\:\\__\\",
			" \\:\\~~\\~~\\/__/ \\:\\/:/ /:/  / \\:\\  \\ /:/  / /\\  \\ |:|  |  \\/\\:\\  \\__  \\:\\~~\\  \\/__/",
			"  \\:\\  \\        \\::/_/:/  /   \\:\\  /:/  /  \\:\\  \\|:|  |     \\:\\/\\__\\  \\:\\  \\      ",
			"   \\:\\  \\        \\:\\/:/  /     \\:\\/:/  /    \\:\\__|:|__|      \\::/  /   \\:\\  \\     ",
			"    \\:\\__\\        \\::/  /       \\::/  /      \\::::/__/       /:/  /     \\:\\__\\    ",
			"     \\/__/         \\/__/         \\/__/        ~~~~           \\/__/       \\/__/    ",
			"",
			"",
			"",
			"",
		},
		center = {
			{
				icon = " ",
				icon_hl = "Title",
				desc = "University",
				desc_hl = "String",
				key = "b",
				key_hl = "Number",
				key_format = " %s",
				action = "Obsidian quick_switch",
			},
			{
				icon = " ",
				icon_hl = "Title",
				desc = "Nix flake",
				desc_hl = "String",
				key = "f",
				key_hl = "Number",
				key_format = " %s",
				action = "Telescope find_files cwd=flake",
			},
		},
		footer = {},
	},
})

vim.api.nvim_set_hl(0, "dashboardheader", { fg = "#945eb8" })

require("gitsigns").setup({
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol",
		delay = 250,
		ignore_whitespace = false,
		virt_text_priority = 100,
		use_focus = true,
	},
	current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",

	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Actions
		map("n", "<leader>hs", gitsigns.stage_hunk)
		map("n", "<leader>hr", gitsigns.reset_hunk)

		map("v", "<leader>hs", function()
			gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)

		map("v", "<leader>hr", function()
			gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)

		map("n", "<leader>hS", gitsigns.stage_buffer)
		map("n", "<leader>hR", gitsigns.reset_buffer)

		map("n", "<leader>hb", function()
			gitsigns.blame_line({ full = true })
		end)

		map("n", "<leader>hd", gitsigns.diffthis)

		map("n", "<leader>hD", function()
			gitsigns.diffthis("~")
		end)

		map("n", "<leader>hQ", function()
			gitsigns.setqflist("all")
		end)
		map("n", "<leader>hq", gitsigns.setqflist)

		-- Toggles
		map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
		map("n", "<leader>tw", gitsigns.toggle_word_diff)
	end,
})

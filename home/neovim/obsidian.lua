require("obsidian").setup({
  legacy_commands = false,

  workspaces = {
    {
      name = "Uni",
      path = "~/Documents/obsidian",
    },
  },

  log_level = vim.log.levels.INFO,

  daily_notes = {
    -- Optional, if you keep daily notes in a separate directory.
    folder = "dailies",
    -- Optional, if you want to change the date format for the ID of daily notes.
    date_format = "%Y-%m-%d",
    -- Optional, if you want to change the date format of the default alias of daily notes.
    alias_format = "%B %-d, %Y",
    -- Optional, default tags to add to each new daily note created.
    default_tags = { "daily-notes" },
    -- (x) Optional, if you want to automatically insert a template from your template directory like 'daily.md'
    template = "daily.md"
  },

  -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
  -- way then set 'mappings = {}'.
  --mappings = {
  --  -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
  --  ["gf"] = {
  --    action = function()
  --      return require("obsidian").util.gf_passthrough()
  --    end,
  --    opts = { noremap = false, expr = true, buffer = true },
  --  },
  --  -- Toggle check-boxes.
  --  ["<C-t>"] = {
  --    action = function()
  --      return require("obsidian").util.toggle_checkbox()
  --    end,
  --    opts = { buffer = true },
  --  },
  --  -- Smart action depending on context, either follow link or toggle checkbox.
  --  ["<C-CR>"] = {
  --    action = function()
  --      return require("obsidian").util.smart_action()
  --    end,
  --    opts = { buffer = true, expr = true },
  --  }
  --},

  new_notes_location = "current_dir",

  -- Optional, customize how note IDs are generated given an optional title.
  ---@param title string|?
  ---@return string
  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    -- In this case a note with the title 'My new note' will be given an ID that looks
    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
    local suffix = ""
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return suffix
  end,

  -- Optional, customize how note file names are generated given the ID, target directory, and title.
  ---@param spec { id: string, dir: obsidian.Path, title: string|? }
  ---@return string|obsidian.Path The full path to the new note.
  note_path_func = function(spec)
    -- This is equivalent to the default behavior.
    local path = spec.dir / tostring(spec.id)
    return path:with_suffix(".md")
  end,

  -- Optional, customize how wiki links are formatted. You can set this to one of:
  --  * "use_alias_only", e.g. '[[Foo Bar]]'
  --  * "prepend_note_id", e.g. '[[foo-bar|Foo Bar]]'
  --  * "prepend_note_path", e.g. '[[foo-bar.md|Foo Bar]]'
  --  * "use_path_only", e.g. '[[foo-bar.md]]'
  -- Or you can set it to a function that takes a table of options and returns a string, like this:
  wiki_link_func = function(opts)
    return require("obsidian.util").wiki_link_id_prefix(opts)
  end,

  -- Optional, customize how markdown links are formatted.
  markdown_link_func = function(opts)
    return require("obsidian.util").markdown_link(opts)
  end,

  -- Either 'wiki' or 'markdown'.
  preferred_link_style = "wiki",

  frontmatter = {
    enabled = true,
    func = require("obsidian.builtin").frontmatter,
    sort = { "id", "aliases", "tags" },
  },

  -- Optional, for templates (see below).
  templates = {
    folder = ".templates",
    date_format = "%d.%m.%Y",
    time_format = "%H:%M",
  },

  -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
  -- URL it will be ignored but you can customize this behavior here.
  ---@param url string
  follow_url_func = function(url)
    -- Open the URL in the default web browser.
    vim.ui.open(url) -- need Neovim 0.10.0+
  end,

  -- Optional, by default when you use `:ObsidianFollowLink` on a link to an image
  -- file it will be ignored but you can customize this behavior here.
  ---@param img string
  follow_img_func = function(img)
    vim.fn.jobstart({"xdg-open", url})  -- linux
  end,


  picker = {
    -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
    name = "telescope.nvim",
    -- Optional, configure key mappings for the picker. These are the defaults.
    -- Not all pickers support all mappings.
    note_mappings = {
      -- Create a new note from your query.
      new = "<C-x>",
      -- Insert a link to the selected note.
      insert_link = "<C-l>",
    },
    tag_mappings = {
      -- Add tag(s) to current note.
      tag_note = "<C-x>",
      -- Insert a tag at the current location.
      insert_tag = "<C-l>",
    },
  },


  -- Set the maximum number of lines to read from notes on disk when performing certain searches.
  search = {
	max_lines = 1000,
  	sort_by = "modified",
  	sort_reversed = true,
  },

  open_notes_in = "current",

  -- Optional, define your own callbacks to further customize behavior.
  callbacks = {
    -- Runs at the end of `require("obsidian").setup()`.
    ---@param client obsidian.Client
    post_setup = function(client) end,

    -- Runs anytime you enter the buffer for a note.
    ---@param note obsidian.Note
    enter_note = function(note)
		if os.execute("[ \"$(pgrep -fl obsidian | grep electron | wc -l)\" = '0' ]") ~= 0 and vim.fn.filereadable(tostring(note.path)) ~= 0 then
			vim.cmd("Obsidian open " .. tostring(note.path))
		end

		vim.keymap.del("n", "ff")
		vim.keymap.set("n", "ff", ":Obsidian quick_switch<CR>")
	end,

    -- Runs anytime you leave the buffer for a note.
    ---@param client obsidian.Client
    ---@param note obsidian.Note
    leave_note = function(client, note) 
		vim.keymap.del("n", "ff")
	  	vim.keymap.set("n", "ff", ":Telescope find_files<CR>")
	end,

    -- Runs right before writing the buffer for a note.
    ---@param client obsidian.Client
    ---@param note obsidian.Note
    pre_write_note = function(client, note) end,

    -- Runs anytime the workspace is set/changed.
    ---@param client obsidian.Client
    ---@param workspace obsidian.Workspace
    post_set_workspace = function(client, workspace) end,
  },

  -- Optional, configure additional syntax highlighting / extmarks.
  -- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
  ui = {
    enable = false,  -- set to false to disable all additional syntax features
  },

  -- Specify how to handle attachments.
  attachments = {
    confirm_img_paste = false,
    img_folder = "assets/images",
  },
})

vim.opt.clipboard = "unnamedplus"

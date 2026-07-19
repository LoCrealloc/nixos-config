{ pkgs, lib, ... }:
{
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      ripgrep # telescope
      imagemagick
      ueberzugpp

      nixd
      pyright
      marksman
      clang-tools
      jdt-language-server
      rust-analyzer
      haskell-language-server
      gitlab-ci-ls
      terraform-ls
      ansible-language-server
      jinja-lsp
      lua-language-server

      prettierd
      isort
      black
      nixfmt
      rustfmt
      stylua
    ];

    extraLuaPackages = luaPkgs: [
      luaPkgs.pathlib-nvim # For neorg
      luaPkgs.lua-utils-nvim # For neorg
      luaPkgs.magick
      luaPkgs.tree-sitter-cli
    ];
    initLua = ''
      vim.opt.inccommand = "split"
      vim.opt.number = true
      vim.opt.relativenumber = true

      vim.opt.wildmode = "longest:full"

      -- setting shiftwidth to 0 makes it always use the value of tabstop
      vim.opt.shiftwidth = 0
      vim.opt.autoindent = true
      vim.opt.expandtab = false
      vim.opt.tabstop = 4

      vim.keymap.set("n", "<F3>", vim.cmd.tabn)
      vim.keymap.set("n", "<F4>", vim.cmd.tabp)
      vim.keymap.set("n", "<ESC>", vim.cmd.noh)
    ''
    + builtins.readFile ./tabstops.lua;

    plugins = with pkgs.vimPlugins; [
      {
        plugin = lualine-nvim;
        type = "lua";
        config = ''
          require('lualine').setup {
            options = {
              theme = 'auto'
            }
          }
        '';
      }
      {
        plugin = material-nvim;
        type = "lua";
        config = builtins.readFile ./material.lua;
      }
      popup-nvim
      plenary-nvim
      telescope-project-nvim
      {
        plugin = telescope-nvim;
        type = "lua";
        config = ''
          vim.keymap.set("n", "<F1>", ":tabnew<CR>:Telescope find_files<CR>")
          vim.keymap.set("n", "<F2>", ":tabclose<CR>")

          vim.keymap.set("n", "ff", ":Telescope find_files<CR>")

          vim.keymap.set("n", "fg", ":Telescope live_grep<CR>")
          vim.keymap.set("n", "fb", ":Telescope buffers<CR>")
        '';
      }
      vim-devicons
      nvim-web-devicons
      {
        plugin = vimtex;
        type = "lua";
        config = ''
          vim.g.vimtex_view_method = "mupdf"

          vim.keymap.set("n", "tc", ":VimtexCompile<CR>")
        '';
      }
      {
        plugin = blink-cmp;
        type = "lua";
        config = builtins.readFile ./blink-cmp.lua;
      }
      {
        plugin = gitsigns-nvim;
        type = "lua";
        config = builtins.readFile ./gitsigns.lua;
      }
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
          vim.lsp.enable("nixd")

          vim.lsp.enable("pyright")

          vim.lsp.enable("clangd")

          vim.lsp.enable("marksman")

          vim.lsp.enable("jdtls")

          vim.lsp.enable("rust_analyzer")

          vim.lsp.enable("hls")

          vim.lsp.enable("gitlab_ci_ls")

          vim.lsp.enable("terraformls")

          vim.lsp.enable("ansible-language-server")

          vim.lsp.enable("jinja_lsp")

          vim.lsp.enable("lua_ls")

          vim.opt.updatetime = 1000

          vim.diagnostic.config({ virtual_text = false })
          vim.api.nvim_create_autocmd({ "CursorHold" }, {
          	callback = function()
          			vim.diagnostic.open_float()
          	end,
          })

          -- vim.keymap.set("i", "<C-o>", function() vim.lsp.buf.code_action({apply=true}) end)


          local telescope_builtin = require('telescope.builtin')
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition)      -- Go to definition
          vim.keymap.set('n', 'gr', telescope_builtin.lsp_references)       -- Find references with telescope
          vim.keymap.set('n', 'K', vim.lsp.buf.hover)             -- Show documentation
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)   -- Rename symbol
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action) -- Code actions
          vim.keymap.set('n', 'gi', telescope_builtin.lsp_implementations)   -- Go to implementation via telescope
        '';
      }
      {
        plugin = nvim-treesitter.withPlugins (
          plugins: with plugins; [
            vim
            nix
            python
            bash
            lua
            haskell
            java
            latex
            bibtex
            c
            asm
            rust
            linkerscript
            gitignore
            dockerfile
            yaml
            json
            html
            javascript
            typescript
            svelte
            css
            markdown_inline
            jinja
            jinja_inline
          ]
        );
        type = "lua";
        config = builtins.readFile ./treesitter.lua;
      }
      {
        plugin = markdown-preview-nvim;
        type = "lua";
        config = ''
          vim.keymap.set("n", "<C-m>", "MarkdownPreviewToggle")
          vim.g.mkdp_browser = "${lib.getExe pkgs.librewolf}"
        '';
      }
      {
        plugin = conform-nvim;
        type = "lua";
        config = builtins.readFile ./conform.lua;
      }
      nvim-nio
      neorg-telescope
      {
        plugin = neorg;
        type = "lua";
        config = builtins.readFile ./neorg.lua;
      }
      {
        plugin = image-nvim;
        type = "lua";
        config = ''
          require("image").setup({
          	backend = "kitty",
          	integrations = {
          		neorg = {
          			enabled = true,
          			clear_in_insert_mode = false,
          			download_remote_images = true,
          			only_render_image_at_cursor = false,
          			filetypes = { "norg" },
          		},
          	},
          })
        '';
      }
      {
        plugin = oil-nvim;
        type = "lua";
        config = ''
          require("oil").setup({
          	default_file_explorer = true,				
          	view_options = {
          		show_hidden = true,
          	},
          	git = {
          		mv = function(src_path, dest_path)
          			return true
          		end,
          	},
          })
          vim.keymap.set("n", "-", ":Oil<CR>", { desc = "Open parent directory" })
        '';
      }
      {
        plugin = dashboard-nvim;
        type = "lua";
        config = builtins.readFile ./dashboard.lua;
      }
      {
        plugin = obsidian-nvim;
        type = "lua";
        config = builtins.readFile ./obsidian.lua;
      }
    ];
  };
}

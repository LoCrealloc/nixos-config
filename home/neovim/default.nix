{ pkgs, ... }:
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
      ccls
      jdt-language-server
      rust-analyzer
      haskell-language-server
      gitlab-ci-ls
      terraform-ls

      prettierd
      isort
      black
      nixfmt-rfc-style
      rustfmt
    ];

    extraLuaPackages = luaPkgs: [
      luaPkgs.pathlib-nvim # For neorg
      luaPkgs.lua-utils-nvim # For neorg
      luaPkgs.magick
    ];

    extraConfig = ''
      au VimLeave * set guicursor=a:ver100
      set guicursor=
      set number

      set autoindent
      set noexpandtab
      set tabstop=4
      " settings shiftwidth to 0 makes it always use the value of tabstop
      set shiftwidth=0

      inoremap <F1> <ESC>
      nnoremap <F1> <ESC>
      vnoremap <F1> <ESC>

      nnoremap <F3> :tabp<CR>
      nnoremap <F4> :tabn<CR>

      nn <esc> :noh<cr>

      set wildmode=longest:full

      set number
      set relativenumber
    '';

    extraLuaConfig = ''
      vim.opt.inccommand = "split"
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
        config = ''
          let g:vimtex_view_method = 'mupdf'

          let g:vimtex_compiler_latexmk = {
          \ 'options' : [
          \   '-pdf',
          \   '-shell-escape',
          \   '-verbose',
          \   '-file-line-error',
          \   '-synctex=1',
          \   '-interaction=nonstopmode',
          \ ],
          \}

          nnoremap tc :VimtexCompile<CR>
        '';
      }
      vim-ccls
      nvim-jdtls
      coq-artifacts
      {
        plugin = coq_nvim;
        type = "lua";
        config = builtins.readFile ./coq_nvim.lua;
      }
      {
        plugin = coq-thirdparty;
        type = "lua";
        config = ''
          require("coq_3p") {
          	{ src = "nvimlua", short_name = "nLUA", conf_only = false },
          	{ src = "vimtex",  short_name = "vTEX" },
          }
        '';
      }
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
          vim.lsp.config("nixd", coq.lsp_ensure_capabilities())
          vim.lsp.enable("nixd")

          vim.lsp.config("pyright", coq.lsp_ensure_capabilities())
          vim.lsp.enable("pyright")

          vim.lsp.config("ccls", coq.lsp_ensure_capabilities())
          vim.lsp.enable("ccls")

          vim.lsp.config("marksman", coq.lsp_ensure_capabilities())
          vim.lsp.enable("marksman")

          vim.lsp.config("jdtls", coq.lsp_ensure_capabilities())
          vim.lsp.enable("jdtls")

          vim.lsp.config("rust_analyzer", coq.lsp_ensure_capabilities())
          vim.lsp.enable("rust_analyzer")

          vim.lsp.config("hls", coq.lsp_ensure_capabilities())
          vim.lsp.enable("hls")

          vim.lsp.config("gitlab_ci_ls", coq.lsp_ensure_capabilities())
          vim.lsp.enable("gitlab_ci_ls")

          vim.lsp.config("terraformls", coq.lsp_ensure_capabilities())
          vim.lsp.enable("terraformls")


          vim.opt.updatetime = 1000

          vim.diagnostic.config({ virtual_text = false })
          vim.api.nvim_create_autocmd({ "CursorHold" }, {
          	callback = function()
          			vim.diagnostic.open_float()
          	end,
          })

          vim.keymap.set("i", "<C-o>", function() vim.lsp.buf.code_action({apply=true}) end)
        '';
      }
      {
        plugin = nvim-treesitter.withPlugins (
          plugins: with plugins; [
            nix
            python
            vim
            markdown_inline
            latex
            bibtex
            c
            rust
            bash
            dockerfile
            svelte
            gitignore
            yaml
            json
            html
            css
            java
            javascript
            typescript
            pkgs.tree-sitter-grammars.tree-sitter-norg-meta
            haskell
            asm
          ]
        );
        type = "lua";
        config = ''
          require'nvim-treesitter.configs'.setup {
          	highlight = {
          		enable = true,

          		additional_vim_regex_highlighting = false,
          	},
          }	
        '';
      }
      {
        plugin = markdown-preview-nvim;
        config = ''
          autocmd Filetype markdown setlocal tabstop=2
          autocmd Filetype markdown setlocal autoindent
          autocmd Filetype markdown setlocal noexpandtab
          autocmd Filetype markdown setlocal shiftwidth=2
          let g:mkdp_browser = '${pkgs.librewolf}/bin/librewolf'

          nmap <C-m> <Plug>MarkdownPreviewToggle
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
          vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
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

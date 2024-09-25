{ pkgs, ... }:

{
  # lsp language servers

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

      nil
      pyright
      marksman
      ccls
      jdt-language-server
      rust-analyzer

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
      set shiftwidth=4

      inoremap <F1> <ESC>
      nnoremap <F1> <ESC>
      vnoremap <F1> <ESC>


      au BufRead,BufNewFile *.nix set filetype=nix

      autocmd Filetype nix setlocal tabstop=2
      autocmd Filetype nix setlocal autoindent
      autocmd Filetype nix setlocal noexpandtab
      autocmd Filetype nix setlocal shiftwidth=2

      nnoremap <F3> :tabp<CR>
      nnoremap <F4> :tabn<CR>

      nn <esc> :noh<cr>
    '';

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
        plugin = nerdtree;
        config = ''
          let g:NERDTreeShowHidden = 1
          let g:NERDTreeMinimalUI = 1
          let g:NERDTreeIgnore = []
          nnoremap <silent> <C-b> :NERDTreeToggle<CR>
        '';
      }
      vim-nerdtree-syntax-highlight
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
        config = ''
          nnoremap <F1> :tabnew<CR>:Telescope find_files<CR>
          nnoremap <F2> :tabclose<CR>

          nnoremap ff <cmd>Telescope find_files<cr>
          nnoremap fg <cmd>Telescope live_grep<cr>
          nnoremap fb <cmd>Telescope buffers<cr>
          nnoremap fh <cmd>Telescope help_tags<cr>
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
      {
        plugin = indent-blankline-nvim;
        type = "lua";
        config = ''
          require("ibl").setup()
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
          local lsp = require "lspconfig"
          lsp.nil_ls.setup(coq.lsp_ensure_capabilities())
          lsp.pyright.setup(coq.lsp_ensure_capabilities())
          lsp.ccls.setup(coq.lsp_ensure_capabilities())
          lsp.marksman.setup(coq.lsp_ensure_capabilities())
          lsp.jdtls.setup(coq.lsp_ensure_capabilities())
          lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities())
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
            norg
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
    ];
  };
}

{ pkgs, ... }:
let
  cmp-vimtex = (
    pkgs.vimUtils.buildVimPlugin {
      pname = "cmp-vimtex";
      version = "2024-02-26";
      src = pkgs.fetchFromGitHub {
        owner = "micangl";
        repo = "cmp-vimtex";
        rev = "613fbfc54d9488252b0b0289d6d1d60242513558";
        sha256 = "sha256-07FqXsRe0RP5f3b6osrsi5gai+bZi9ybm5JL/nnBH+4=";
      };
      meta.homepage = "https://github.com/micangl/cmp-vimtex";
    }
  );
in
{
  # lsp language servers
  home.packages = with pkgs; [
    nil
    python3.pkgs.jedi-language-server
    ripgrep # telescope
    marksman
    ccls

    prettierd
    isort
    black
    nixpkgs-fmt
  ];

  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
    vimdiffAlias = true;

    extraConfig = ''
      noremap ö l
      noremap l k
      noremap k j
      noremap j h

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
      vim-airline
      {
        plugin = vim-airline-themes;
        config = ''
          set guicursor=
          if (has("termguicolors"))
          	set termguicolors
          endif
          syntax enable
          let g:material_theme_style = 'ocean-community'
          let g:material_terminal_italics = 1
          colorscheme material
          let g:airline_theme = 'material'
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
      material-vim
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
        plugin = lsp-zero-nvim;
        type = "lua";
        config = ''
          local lsp_zero = require('lsp-zero')
          lsp_zero.extend_lspconfig()

          lsp_zero.on_attach(function(client, bufnr)
          	lsp_zero.default_keymaps({buffer = bufnr})
          end)
        '';
      }
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      vim-vsnip
      cmp-vsnip
      cmp-zsh
      cmp-vimtex
      friendly-snippets
      vim-ccls
      {
        plugin = nvim-cmp;
        type = "lua";
        config = builtins.readFile ./nvim-cmp.lua;
      }
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
          require'lspconfig'.nil_ls.setup{}
          require'lspconfig'.jedi_language_server.setup{}
          require'lspconfig'.ccls.setup{}
          require'lspconfig'.marksman.setup{}
        '';
      }
      {
        plugin = nvim-treesitter.withPlugins
          (
            plugins:
              with plugins; [
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
              ]
          );
      }
      {
        plugin = markdown-preview-nvim;
        config = ''
                autocmd Filetype md setlocal tabstop=2
                autocmd Filetype md setlocal autoindent
                autocmd Filetype md setlocal noexpandtab
                autocmd Filetype md setlocal shiftwidth=2
          				'';
      }
      {
        plugin = conform-nvim;
        type = "lua";
        config = builtins.readFile ./conform.lua;
      }
    ];
  };
}
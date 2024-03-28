{pkgs, ...}: {
  # lsp language servers
  home.packages = with pkgs; [
    nil
    python3.pkgs.jedi-language-server
    ripgrep # telescope
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
			cmp-nerdfont
			cmp-vimtex
      friendly-snippets
      vim-ccls
      {
        plugin = nvim-cmp;
        type = "lua";
        config = ''
               					local has_words_before = function()
                 unpack = unpack or table.unpack
                 local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                 return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
               end

               local feedkey = function(key, mode)
                 vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
               end

          local cmp = require'cmp'
          cmp.setup({
          	snippet = {
          		-- REQUIRED - you must specify a snippet engine
          		expand = function(args)
          			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          		end,
          	},
          	window = {
          		completion = cmp.config.window.bordered(),
          		documentation = cmp.config.window.bordered(),
          	},
          	mapping = cmp.mapping.preset.insert({
          		['<C-b>'] = cmp.mapping.scroll_docs(-4),
          		['<C-f>'] = cmp.mapping.scroll_docs(4),
          		['<C-Tab>'] = cmp.mapping.complete(),
          		['<C-e>'] = cmp.mapping.abort(),
          		['<CR>'] = cmp.mapping.confirm({ select = true }),

          		["<Tab>"] = cmp.mapping(function(fallback)
          			if cmp.visible() then
          				cmp.select_next_item()
          			elseif vim.fn["vsnip#available"](1) == 1 then
          				feedkey("<Plug>(vsnip-expand-or-jump)", "")
          			elseif has_words_before() then
          				cmp.complete()
          			else
          				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
          			end
          		end, { "i", "s" }),

          		["<S-Tab>"] = cmp.mapping(function()
          			if cmp.visible() then
          				cmp.select_prev_item()
          			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
          				feedkey("<Plug>(vsnip-jump-prev)", "")
          			end
          		end, { "i", "s" }),
          	}),
          	sources = {
          		{ name = 'nvim_lsp' },
          		{ name = 'vsnip' },
          		{ name = 'buffer' },
          		{ name = 'zsh' },
          		{ name = 'nerdfont' },
          		{ name = 'vimtex' },
          	};
          })

          -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
          cmp.setup.cmdline({ '/', '?' }, {
          	mapping = cmp.mapping.preset.cmdline(),
          	sources = {
          		{ name = 'buffer' },
          		{ name = 'path' },
          	};
          })

          -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
          cmp.setup.cmdline(':', {
          	mapping = cmp.mapping.preset.cmdline(),
          	sources = cmp.config.sources({
          		{ name = 'path' },
          		{ name = 'cmdline' },
          	}),
          	matching = { disallow_symbol_nonprefix_matching = false }
          })
        '';
      }
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
          require'lspconfig'.nil_ls.setup{}
          require'lspconfig'.jedi_language_server.setup{}
          require'lspconfig'.ccls.setup{}
        '';
      }
      {
        plugin = nvim-treesitter.withPlugins (
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
        config = ''


        '';
      }
      markdown-preview-nvim
    ];
  };
}

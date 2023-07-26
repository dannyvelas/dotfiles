if &shell =~# 'fish$'
  set shell=bash
endif

" plugins
  " vim-plug
    call plug#begin()
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'morhetz/gruvbox'
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-fugitive'
    Plug 'justinmk/vim-sneak'
    Plug 'tpope/vim-abolish'
    Plug 'godlygeek/tabular'
    Plug 'prettier/vim-prettier'
    Plug 'bkad/CamelCaseMotion'
    Plug 'leafgarland/typescript-vim'
    Plug 'leafOfTree/vim-svelte-plugin'
    Plug 'nbouscal/vim-stylish-haskell'
    Plug 'Glench/Vim-Jinja2-Syntax'
    Plug 'tpope/vim-surround'
    Plug 'bfrg/vim-jq'
    Plug 'wuelnerdotexe/vim-astro'
    " clojure
    Plug 'Olical/conjure'
    Plug 'guns/vim-sexp'
    Plug 'tpope/vim-sexp-mappings-for-regular-people'
    Plug 'kien/rainbow_parentheses.vim'
    " Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    call plug#end()

  " nerdtree
    let NERDTreeShowHidden=1
    let NERDTreeShowLineNumbers=1
    let NERDTreeNaturalSort=1
    autocmd FileType nerdtree setlocal relativenumber

    " close if nerdtree is last window
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
          \ quit | endif

    " toggle nerdtree
    nnoremap <silent> <C-t> :NERDTreeToggle<CR>

  " coc
    " trigger suggestions
    inoremap <silent><expr> <C-space> coc#refresh()

    " select suggestions with tab
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    "jump to next error
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    
    " auto-format elm files on save
    autocmd BufWritePost *.elm :call CocAction('format')

    " jump to floating error messages window
    nnoremap <silent> <C-w>p :call coc#float#jump()<CR>

  " vim-svelte-plugin
    let g:vim_svelte_plugin_use_typescript = 1

  " prettier
    let g:prettier#quickfix_enabled = 0
    let g:prettier#autoformat_require_pragma = 0
    au BufWritePre *.css,*.svelte,*.pcss,*.html,*.ts,*.js,*.json,*.astro PrettierAsync

  " camel-case motion
    let g:camelcasemotion_key = '<leader>'

  " fugitive
    nnoremap <silent> <leader>g :vertical rightbelow G<CR>

  " vim-sneak
    map f <Plug>Sneak_f
    map F <Plug>Sneak_F
    map t <Plug>Sneak_t
    map T <Plug>Sneak_T

    map s <Plug>Sneak_s
    map S <Plug>Sneak_S

  " vim-surrond
    let g:surround_no_mappings= 1
    xmap z <Plug>VSurround
    nmap yzz <Plug>Yssurround
    nmap yz  <Plug>Ysurround
    nmap dz  <Plug>Dsurround
    nmap cz  <Plug>Csurround

" Theme
  colorscheme gruvbox
  set bg=dark

" Functionality
  syntax on
  set smartcase
  set ignorecase
  set showmode
  set nowrap
  set sidescroll=5
  set tabstop=2
  set shiftwidth=2
  set expandtab
  set mouse=a
  set number relativenumber
  set autoindent
  set smartindent
  set virtualedit=onemore
  set nohlsearch
  set foldmethod=indent
  set clipboard+=unnamedplus
  set showcmd
  set diffopt=internal,filler,vertical
  set splitright
  set inccommand=nosplit
  set nofixendofline
  set hidden

" transparency
  hi Normal guibg=NONE ctermbg=NONE

" re-mappings
  " delete with no cut in any mode
    nnoremap x "_x
    nnoremap X "_X
    nnoremap c "_c
    nnoremap C "_C
    nnoremap d "_d
    nnoremap D "_D

    vnoremap c "_c
    vnoremap d "_d
    vnoremap P "_dP
    vnoremap p "_dp

  " normal mode key bindings
    "add one line above
    nnoremap <silent> <C-]> :call append(line('.')-1, '')<CR>

    "move current line to EO prev line
    nnoremap _ ^"_d0i<Bs>

    "yank entire file
    nnoremap <silent> YY :%y+<CR>

    "automatically choose file for new pane
    nnoremap <C-w>v <C-w>v<C-w>l:
    nnoremap <C-w>s <C-w>s<C-w>j:

    "restart syntax highlighting
    nnoremap <silent> ++ :syn sync fromstart<CR>

    " normal mode save
    nnoremap <C-s> :w<CR>

    " quick search and replace
    nnoremap gs :%s/

    " turn off full page scroll
    nnoremap <C-f>  <Nop>

  " insert mode bindings
    "escape
    inoremap <C-[> <Esc>l

    " escape and save
    inoremap <C-s> <Esc>l:w<CR>

    " move current line to EO prev line
    inoremap ,e <Esc>^"_d0i<Bs>

    " if the first character of a line is '*' and the cursor is after that character, then <Cr> makes a new line that starts with '*'
    inoremap <expr> <Cr> (trim(getline('.'))[0]=='*' && getpos('.')[2]>stridx(getline('.'), '*')+1) ? '<Cr>*<space>' : '<Cr>'

    " avoid accidentally pasting text
    inoremap <C-space> <space>

    " insert-mode move up and down
    inoremap <C-j> <C-o>j
    inoremap <C-k> <C-o>k

    " shift insert mode
    inoremap <C-t> <C-d>
    inoremap <C-y> <C-t>
    
    " copy character below
    inoremap <C-c> <C-e>

    " diagraphs
    inoremap <C-\> <C-k>

  " readline bindings (cred: github.com/tpope/vim-rsi)
    inoremap <C-A> <C-O>^
    cnoremap <C-A> <Home>

    " noremap! == insert and command mode
    noremap! <C-X><C-A> <C-A>
    noremap! <C-B> <Left>
    noremap! <C-D> <Delete>
    
    " if at EOL, copy char above cursor. otherwise go to EOL
    inoremap <expr> <C-E> col('.')>strlen(getline('.')) ? "\<Lt>C-Y>" : "\<Lt>End>"

    inoremap <C-F> <Right>

    " if at EOL, open command history, otherwise move right
    cnoremap <expr> <C-F> getcmdpos()>strlen(getcmdline()) ? &cedit : "\<Lt>Right>"

    cnoremap <C-X><C-k> <C-k>
    cnoremap <C-k> <c-\>egetcmdline()[:getcmdpos()-2]<CR>

    function! s:ctrl_u()
      if getcmdpos() > 1
        let @- = getcmdline()[:getcmdpos()-2]
      endif
      return "\<C-U>"
    endfunction
    cnoremap <expr> <C-U> <SID>ctrl_u()

    noremap! <M-b> <S-Left>
    inoremap <M-f> <C-o>e<Right>
    cnoremap <M-f> <S-Right>
    inoremap <M-d> <C-O>dw
    cnoremap <M-d> <S-Right><C-W>
    noremap! <M-n> <Down>
    noremap! <M-p> <Up>

  " terminal mode bindings
    " open
    nnoremap <C-\> <C-w>s<C-w>j:terminal<CR>A

    " escape
    tnoremap <C-[> <C-\><C-n>
  
  " cabbrevs
    " open help in vertical window
    cabbrev help <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vertical help' : 'help')<Cr>

  " custom commands
    if !exists(":Bd")
      command Bd bp | sp | bn | bd
    end

" file specific settings
  " ts react
    autocmd BufNewFile,BufReadPost *.tsx setlocal filetype=typescript.tsx

  " format Markdown
    augroup formatmd
      autocmd BufNewFile,BufReadPost *.md setlocal wrap | setlocal breakindent | setlocal linebreak | setlocal breakindentopt=shift:2,min:40
      autocmd BufNewFile,BufReadPost *.md setlocal shiftwidth=4 | setlocal tabstop=4
      autocmd BufNewFile,BufReadPost *.md nnoremap <buffer> <expr> j v:count == 0 ? 'gj' : "\<Esc>".v:count.'j'
      autocmd BufNewFile,BufReadPost *.md nnoremap <buffer> <expr> k v:count == 0 ? 'gk' : "\<Esc>".v:count.'k'
      autocmd BufNewFile,BufReadPost *.md setlocal spell spelllang=en_us
    augroup end

  " golang
    autocmd BufNewFile,BufReadPost *.go set noexpandtab

  " fish
    autocmd BufNewFile,BufReadPost *.fish setlocal tabstop=4 | setlocal shiftwidth=4

  " json comments
    autocmd FileType json syntax match Comment +\/\/.\+$+

" spell-check highlighting
  " Word not recognized
    hi clear SpellBad
    hi SpellBad cterm=underline ctermfg=red

  " Word not capitalized
    hi clear SpellCap
    hi SpellCap cterm=underline ctermfg=yellow

  " Word is rare
    hi clear SpellRare
    hi SpellRare cterm=underline ctermfg=green

  " Wrong spelling for selected region
    hi clear SpellLocal
    hi SpellLocal cterm=underline ctermfg=blue

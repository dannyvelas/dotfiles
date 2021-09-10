if &shell =~# 'fish$'
  set shell=bash
endif

" plugins
  " vim-plug
  call plug#begin()
  Plug 'neoclide/coc.nvim', {'commit': 'a336a8bc251702d9526a6818ae56e86d92fafc0c' }
  Plug 'morhetz/gruvbox', { 'commit': 'bf2885a95efdad7bd5e4794dd0213917770d79b7' }
  Plug 'preservim/nerdtree', { 'commit': 'a1fa4a33bf16b6661e502080fc97788bb98afd35' }
  Plug 'tpope/vim-abolish', { 'commit': '7e4da6e78002344d499af9b6d8d5d6fcd7c92125' }
  Plug 'dag/vim-fish', { 'commit': '50b95cbbcd09c046121367d49039710e9dc9c15f' }
  Plug 'Yggdroot/indentLine', { 'commit': '5617a1cf7d315e6e6f84d825c85e3b669d220bfa' }
  Plug 'sirver/ultisnips', {'commit': '66d81fc2c0bda30be69fffa46da0932ee8d5ddd5' }
  Plug 'prettier/vim-prettier', {'commit': 'aa0607ca7a0f61e91365ecf25947312ff4796302' } 
  Plug 'leafgarland/typescript-vim', {'commit': '67e81e4292186889a1a519e1bf3a600d671237eb' }
  Plug 'leafOfTree/vim-svelte-plugin', {'commit': 'f010611c84b760c0d918490423a56d26d8ab865c' }
  Plug 'tpope/vim-fugitive', { 'commit': '8e0a8abf08318f91f63da510087b3110f20e58bf' }
  Plug 'godlygeek/tabular', { 'commit': '339091ac4dd1f17e225fe7d57b48aff55f99b23a' }
  Plug 'justinmk/vim-sneak', { 'commit': '95374ad3e4b5ef902854e8f4bcfa9a7a31a91d71' }
  Plug 'tpope/vim-rsi'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  call plug#end()

  " indent line
    let g:indentLine_fileType = ['python', 'text']

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

  " ultisnips
    let g:UltiSnipsExpandTrigger = '<C-]>'
    let g:UltiSnipsJumpForwardTrigger = '<C-]>'
    let g:UltiSnipsJumpBackwardTrigger = '<C-Z>'

  " vim-svelte-plugin
    let g:vim_svelte_plugin_use_typescript = 1

  " prettier
    let g:prettier#quickfix_enabled = 0
    let g:prettier#autoformat_require_pragma = 0
    au BufWritePre *.css,*.svelte,*.pcss,*.html,*.ts,*.js,*.json PrettierAsync

  " fugitive
    nnoremap <silent> <leader>g :vertical rightbelow G<CR>

  " vim-sneak
    map f <Plug>Sneak_f
    map F <Plug>Sneak_F
    map t <Plug>Sneak_t
    map T <Plug>Sneak_T

    map s <Plug>Sneak_s
    map S <Plug>Sneak_S

  " fzf spawn
    nnoremap <C-h> :Files<CR>
    nnoremap <C-b> :Buffers<CR>

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
  set clipboard=unnamedplus
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

    "go to middle of line
    nnoremap <silent> gm :call cursor(0, len(getline('.'))/2)<CR>

    "move current line to EO prev line
    nnoremap _ ^"_d0i<Bs>

    "yank entire file
    nnoremap <silent> YY :%y+<CR>

    "replace word independent of cursor position
    nnoremap <leader>c b"_cw

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
    inoremap <expr> <Cr> (trim(getline('.'))[0]=='*' && getpos('.')[2]>stridx(getline('.'), '*')+1) ? '<Cr>*<space><C-d>' : '<Cr>'

    " avoid accidentally pasting text
    inoremap <C-space> <space>

    " insert-mode move up and down
    inoremap <C-j> <C-o>j
    inoremap <C-k> <C-o>k

    " shift insert mode
    inoremap <C-t> <C-d>
    inoremap <C-y> <C-t>

    " re-align vertical viewport to left margin
    inoremap <leader>z <C-o>0<C-o>$

    " go to end of word
    inoremap <leader>ew <C-o>e<Right>

    " diagraphs
    inoremap <C-\> <C-k>

  " terminal mode bindings
    " open
    nnoremap <C-\> <C-w>s<C-w>j:terminal<CR>A
    " escape
    tnoremap <C-[> <C-\><C-n>
  
  " cabbrevs
    " open help in vertical window
    cabbrev help <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vertical help' : 'help')<Cr>

" file specific settings
  " ts react
    autocmd BufNewFile,BufReadPost *.tsx setlocal filetype=typescript.tsx

  " txt files
    augroup formattxt
      autocmd BufNewFile,BufReadPost *.txt setlocal textwidth=79 | setlocal formatoptions+=tqnro
      autocmd BufNewFile,BufReadPost *.txt setlocal spell spelllang=en_us
    augroup end

  " fish
    autocmd FileType fish compiler fish
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

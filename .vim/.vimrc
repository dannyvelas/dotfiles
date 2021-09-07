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
  "escape insert mode
  inoremap <C-[> <Esc>l

  "delete with no cut
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

  "add one line above
  nnoremap <silent> <C-]> :call append(line('.')-1, '')<CR>
  nnoremap <silent> <leader>b :call append(line('.'), '')<CR>

  "go to middle of line
  nnoremap <silent> gm :call cursor(0, len(getline('.'))/2)<CR>

  "move current line to EO prev line
  nnoremap _ ^"_d0i<Bs>
  inoremap ,e <Esc>^"_d0i<Bs>

  "forward delete
  inoremap <C-d> <Del>

  "yank entire file
  nnoremap <silent> YY :%y+<CR>

  "replace word independent of cursor position
  nnoremap <leader>c b"_cw

  "automatically choose file for new pane
  nnoremap <C-w>v <C-w>v<C-w>l:
  nnoremap <C-w>s <C-w>s<C-w>j:

  "restart syntax highlighting
  nnoremap <silent> ++ :syn sync fromstart<CR>

  " insert mode escape and save
  inoremap <C-s> <Esc>l:w<CR>

  " normal mode save
  nnoremap <C-s> :w<CR>

  " command mode remappings to behave like terminal shortcuts
  cnoremap <C-a> <Home>
  cnoremap <C-e> <End>
  cnoremap <C-k> <C-\>estrpart(getcmdline(),0,getcmdpos()-1)<CR>
  cnoremap <C-b> <Left>
  cnoremap <C-f> <Right>
  cnoremap <M-b> <S-Left>
  cnoremap <M-f> <S-Right>
  cnoremap <C-d> <Del>

  " if the first character of a line is '*' and the cursor is after that character, then <Cr> makes a new line that starts with '*'
  inoremap <expr> <Cr> (trim(getline('.'))[0]=='*' && getpos('.')[2]>stridx(getline('.'), '*')+1) ? '<Cr>*<space><C-d>' : '<Cr>'

  " avoid accidentally pasting text
  inoremap <C-space> <space>

  " insert-mode terminal shortcuts
  inoremap <C-e> <C-o>$
  inoremap <C-b> <Left>
  inoremap <C-f> <Right>

  " insert-mode move up and down
  inoremap <C-j> <C-o>j
  inoremap <C-k> <C-o>k

  " escape from terminal-job mode
  tnoremap <C-[> <C-\><C-n>

  " shift insert mode
  inoremap <C-t> <C-d>
  inoremap <C-y> <C-t>

  " re-align vertical viewport to left margin
  inoremap <leader>z <C-o>0<C-o>$

  " open terminal mode
  nnoremap <C-\> <C-w>s<C-w>j:terminal<CR>A

  " forward-delete words quickly
  inoremap <M-d> <Esc>l"_cw

  " go to end of word
  inoremap <leader>ew <C-o>e<Right>

  " diagraphs
  inoremap <C-\> <C-k>
  
  " quick search and replace
  nnoremap gs :%s/

  " turn off full page scroll
  nnoremap <C-f>  <Nop>

  " open help in vertical window
  cabbrev help <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vertical help' : 'help')<Cr>

" file specific settings
  " detect ts react
  autocmd BufNewFile,BufReadPost *.tsx setlocal filetype=typescript.tsx

  " format txt files
  augroup formattxt
    autocmd BufNewFile,BufReadPost *.txt setlocal textwidth=79 | setlocal formatoptions+=tqnro
    autocmd BufNewFile,BufReadPost *.txt setlocal spell spelllang=en_us
  augroup end

  autocmd FileType fish compiler fish
  autocmd BufNewFile,BufReadPost *.fish setlocal tabstop=4 | setlocal shiftwidth=4

  " support for json comments
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

" sub/super scripts
  execute "digraphs as " . 0x2090
  execute "digraphs es " . 0x2091
  execute "digraphs hs " . 0x2095
  execute "digraphs is " . 0x1D62
  execute "digraphs js " . 0x2C7C
  execute "digraphs ks " . 0x2096
  execute "digraphs ls " . 0x2097
  execute "digraphs ms " . 0x2098
  execute "digraphs ns " . 0x2099
  execute "digraphs os " . 0x2092
  execute "digraphs ps " . 0x209A
  execute "digraphs rs " . 0x1D63
  execute "digraphs ss " . 0x209B
  execute "digraphs ts " . 0x209C
  execute "digraphs us " . 0x1D64
  execute "digraphs vs " . 0x1D65
  execute "digraphs xs " . 0x2093

  execute "digraphs aS " . 0x1d43
  execute "digraphs bS " . 0x1d47
  execute "digraphs cS " . 0x1d9c
  execute "digraphs dS " . 0x1d48
  execute "digraphs eS " . 0x1d49
  execute "digraphs fS " . 0x1da0
  execute "digraphs gS " . 0x1d4d
  execute "digraphs hS " . 0x02b0
  execute "digraphs iS " . 0x2071
  execute "digraphs jS " . 0x02b2
  execute "digraphs kS " . 0x1d4f
  execute "digraphs lS " . 0x02e1
  execute "digraphs mS " . 0x1d50
  execute "digraphs nS " . 0x207f
  execute "digraphs oS " . 0x1d52
  execute "digraphs pS " . 0x1d56
  execute "digraphs rS " . 0x02b3
  execute "digraphs sS " . 0x02e2
  execute "digraphs tS " . 0x1d57
  execute "digraphs uS " . 0x1d58
  execute "digraphs vS " . 0x1d5b
  execute "digraphs wS " . 0x02b7
  execute "digraphs xS " . 0x02e3
  execute "digraphs yS " . 0x02b8
  execute "digraphs zS " . 0x1dbb

  execute "digraphs AS " . 0x1D2C
  execute "digraphs BS " . 0x1D2E
  execute "digraphs DS " . 0x1D30
  execute "digraphs ES " . 0x1D31
  execute "digraphs GS " . 0x1D33
  execute "digraphs HS " . 0x1D34
  execute "digraphs IS " . 0x1D35
  execute "digraphs JS " . 0x1D36
  execute "digraphs KS " . 0x1D37
  execute "digraphs LS " . 0x1D38
  execute "digraphs MS " . 0x1D39
  execute "digraphs NS " . 0x1D3A
  execute "digraphs OS " . 0x1D3C
  execute "digraphs PS " . 0x1D3E
  execute "digraphs RS " . 0x1D3F
  execute "digraphs TS " . 0x1D40
  execute "digraphs US " . 0x1D41
  execute "digraphs VS " . 0x2C7D
  execute "digraphs WS " . 0x1D42 

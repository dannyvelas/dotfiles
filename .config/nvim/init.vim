" load vimrc config
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Telescope
  " Buffers
    nnoremap <silent> <leader>b :lua require('telescope.builtin').buffers()<CR>

  " File Search
    " regular
    nnoremap <silent> <C-h> :lua require('telescope.builtin').find_files()<CR>
    " including hidden files
    nnoremap <silent> <leader>th :lua require('telescope.builtin').find_files({hidden=true})<CR>
    " including gitignore files
    nnoremap <silent> <leader>ti :lua require('telescope.builtin').find_files({no_ignore=true})<CR>
    " including all
    nnoremap <silent> <leader>ta :lua require('telescope.builtin').find_files({hidden=true, no_ignore=true})<CR>

  " Grep
    " ripgrep regular
    nnoremap <silent> <leader>rr :lua require('telescope.builtin').live_grep()<CR>
    " ripgrep including hidden files
    nnoremap <silent> <leader>rh :lua require('telescope.builtin').live_grep({ vimgrep_arguments = { "rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--hidden" }})<Cr>
    " ripgrep including gitignore files
    nnoremap <silent> <leader>ri :lua require('telescope.builtin').live_grep({ vimgrep_arguments = { "rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--no-ignore" }})<Cr>
    " ripgrep including hidden and gitignore (all) files
    nnoremap <silent> <leader>ra :lua require('telescope.builtin').live_grep({ vimgrep_arguments = { "rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--hidden", "--no-ignore" }})<Cr>

lua << EOF
  require('telescope').setup {
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the telescope generic sorter
        override_file_sorter = true,     -- override the telescope file sorter
      }
    }
  }

  require('telescope').load_extension('fzf')
EOF

set t_Co=256
execute pathogen#infect()
Helptags
syntax on
filetype plugin indent on
colorscheme solarized
set background=dark
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set showmatch " highlight matching parentheses
set ignorecase
set smartcase
set scrolloff=5
set number  
set hlsearch

highlight Comment cterm=italic

" SHORTCUTS
map <F5> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>

" Syntastic settings
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_aggregate_errors = 1


" This enable the column highlight for the the 80th column
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

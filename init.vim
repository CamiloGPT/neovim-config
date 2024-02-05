call plug#begin('~/.vim/plugged')

Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'ctrlpvim/ctrlp.vim'


let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-explorer',
  \ 'coc-git',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-eslint',
  \ 'coc-css',
  \ 'coc-emmet',
  \ 'coc-graphql',
  \ 'coc-rls'
  \ ]


"python
Plug 'davidhalter/jedi-vim'

"Rust
Plug 'rust-lang/rust.vim'

"Astro
Plug 'wuelnerdotexe/vim-astro'
Plug 'yaegassy/coc-astro', {'do': 'yarn install --frozen-lockfile'}

call plug#end()

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

set termguicolors
set background=dark
colorscheme gruvbox-material
set number
set relativenumber
set expandtab
set tabstop=2
set nowrap
set modifiable
set clipboard+=unnamedplus

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

let g:yats_host_keyword = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#left_sep = '👽'
let g:airline_theme = 'gruvbox_material'
let g:airline#extensions#tabline#enabled = 1

let g:astro_typescript = 'enable'
let g:astro_stylus = 'enable'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <space>f :Prettier<CR>
nmap <space>e :CocCommand explorer<CR>
nmap <space>h :bprevious<CR>
nmap <space>l :bnext<CR>
nmap <space>b :bdelete<CR>
nmap <C-s> :write<CR>

nnoremap <esc> :noh<return><esc>


let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

let g:rustfmt_autosave = 1

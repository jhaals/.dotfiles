syntax on
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'sjl/gundo.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'klen/python-mode'
Bundle 'scrooloose/syntastic'
Bundle 'kchmck/vim-coffee-script'
Bundle 'godlygeek/tabular'
Bundle 'altercation/vim-colors-solarized'
Bundle 'rodjek/vim-puppet'
Bundle 'tpope/vim-surround'
Bundle 'airblade/vim-gitgutter'
Bundle 'motemen/git-vim'
Bundle 'SirVer/ultisnips'
Bundle 'bling/vim-airline'
Bundle 'tomtom/tcomment_vim'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'tpope/vim-markdown'
" Clojure
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'

Bundle 'kien/rainbow_parentheses.vim'
filetype plugin indent on
set laststatus=2
set backspace=2 " make backspace work like most other apps
set encoding=utf-8
set background=dark
colorscheme solarized
set autoindent      " Indent same level as the previous line
"set t_Co=256        " 256 colors
set smartindent
map <F3> :set list!
set title

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" TABS
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
autocmd FileType ruby setlocal ts=2 sts=2 sw=2
autocmd FileType coffee setlocal ts=2 sts=2 sw=2
autocmd FileType clojure setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2
set listchars=tab:»\ ,trail:·
set list
cmap w!! %!sudo tee > /dev/null %

" SEARCH highlight
set incsearch
set hlsearch

"syntac check
let mapleader = ","

let g:syntastic_enable_signs=1
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_loc_list=2
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': ['puppet', 'ruby', 'php', 'bash'],
    \ 'passive_filetypes': [] }

autocmd BufReadPost * :SyntasticCheck

map <Leader>e :SyntasticCheck<CR>

map <Leader>n :set nonumber<CR>
map <Leader>y "+y<CR>
map <Leader>c <c-_><c-_>
" Enable the mouse
"set mouse=a

" Show matching brackets/paranthesis
set showmatch

" Python-mode
let g:pymode_folding = 0
let g:pymode_lint = 0
let g:pymode_syntax_print_as_function = 1

" Trim whitespace off line-endings on save
autocmd BufWritePre * :%s/\s\+$//e

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"rainbow parantheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadSquare

let g:rbpt_colorpairs = [
    \['white', '#FFFFFF'],
    \['darkcyan', '#00FFFF'],
    \['darkmagenta', '#FF00FF'],
    \['darkblue', '#0000FF'],
    \['darkyellow', '#FFFF00'],
    \['magenta', '#FF00FF'],
    \['darkgreen', '#00FF00'],
    \['darkred', '#FF0000'],
    \]

" Set this to the number of colors available.
let g:rbpt_max = 8

" On OSX
vmap <D-c> y:call system("pbcopy", getreg("\""))<CR>
nmap <D-v> :call setreg("\"",system("pbpaste"))<CR>p

" highlight 80char limit
let &colorcolumn=join(range(81,999),",")

" Use ag for ctrlp
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
set guifont=Source\ Code\ Pro:h18

if $VIM_CRONTAB == "true"
set nobackup
set nowritebackup
endif

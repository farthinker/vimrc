runtime bundle/pathogen/autoload/pathogen.vim

set nocompatible
set encoding=utf-8
set noswapfile

let g:pathogen_disabled = ['rails', 'ruby']
call pathogen#infect()
filetype plugin indent on

syntax enable
set background=dark
colorscheme solarized
let mapleader=","

set hidden
set number
set ruler
set cursorline
set showcmd
set history=200
set scrolloff=3
set autoread
set autoindent
set smartindent

" Whitespace
set nowrap
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set list
set backspace=indent,eol,start

" List chars
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<
highlight NonText guifg=#063a48
highlight SpecialKey guifg=#063a48 guibg=#002b36

" Searching
set hlsearch                      " highlight matches
set incsearch                     " incremental searching
set ignorecase                    " searches are case insensitive...
set smartcase                     " ... unless they contain at least one capital letter

" Move Line
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" CtrlP
let g:ctrlp_map = '<c-t>'
nnoremap <D-t> :CtrlP<CR>
inoremap <D-t> <Esc>:CtrlP<CR>
nnoremap <D-r> :CtrlPMRU<CR>
inoremap <D-r> :CtrlPMRU<CR>

" End Return
nnoremap <D-CR> o
inoremap <D-CR> <End><CR>
nnoremap <D-;> i<End>;
inoremap <D-;> <End>;

" Other Shortcuts
nnoremap <CR> :nohlsearch<CR>
nnoremap <leader>d :NERDTreeToggle<CR>


if has("autocmd")
  " New File Type
  au BufNewFile,BufRead *.json,*.js.erb set ft=javascript
  au BufNewFile,BufRead *.css.erb set ft=css
  au BufNewFile,BufRead *.css.scss set ft=scss
  au BufNewFile,BufRead *.html.erb set ft=html

  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make set noexpandtab
  au FileType javascript set softtabstop=2 tabstop=2 shiftwidth=2 noexpandtab
  au FileType scss,css set softtabstop=4 tabstop=4 shiftwidth=4 noexpandtab
  au FileType html set softtabstop=4 tabstop=4 shiftwidth=4 noexpandtab
  au FileType python set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
  au FileType ruby,yaml set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
  au FileType vim set softtabstop=2 tabstop=2 shiftwidth=2 expandtab

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif

  " Auto compile less file
  function LessToCss()
    let current_file = shellescape(expand('%:p'))
    let filename = shellescape(expand('%:r'))
    let command = "silent !lessc " . current_file . " " . filename . ".css"
    execute command
  endfunction
  autocmd BufWritePost,FileWritePost *.less call LessToCss()

endif

set splitright
set splitbelow

if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Start the status line
  set statusline=%f\ %m\ %r

  " Add fugitive
  set statusline+=%{fugitive#statusline()}

  " Finish the statusline
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
endif

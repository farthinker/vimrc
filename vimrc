set nocompatible
set encoding=utf-8

let g:pathogen_disabled = ['rails', 'ruby']
call pathogen#infect()
filetype plugin indent on

syntax enable
set background=dark
colorscheme solarized
let mapleader=","

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

if has("autocmd")
  " New File Type
  au BufNewFile,BufRead *.json,*.js.erb set ft=javascript
  au BufNewFile,BufRead *.css.erb set ft=css
  au BufNewFile,BufRead *.css.scss set ft=scss

  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make set noexpandtab
  au FileType python set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
  au FileType ruby,yaml set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
  au FileType vim set softtabstop=2 tabstop=2 shiftwidth=2 expandtab

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif

endif

" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

set splitright
set splitbelow

" Plugin Mappings
nmap <leader>d :NERDTreeToggle<CR>

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

set nocompatible
set encoding=utf-8

let g:pathogen_disabled = ['rails', 'ruby']
call pathogen#infect()
filetype plugin indent on

syntax enable
set background=dark
colorscheme solarized
let mapleader=","

set number      " line numbers are needed
set ruler       " show the cursor position all the time
set cursorline  " highlight the line of the cursor
set showcmd     " show partial commands below the status line
set history=200 " remember more Ex commands
set scrolloff=3 " have some context around the current line always on screen

" Auto-reload buffers when file changed on disk
set autoread

" Whitespace
set nowrap                        " don't wrap lines
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4                  " an autoindent (with <<) is two spaces
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

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
  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make set noexpandtab

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif

  " mark Jekyll YAML frontmatter as comment
  au BufNewFile,BufRead *.{md,markdown,html,xml} sy match Comment /\%^---\_.\{-}---$/

  "au BufNewFile,BufRead *.{rb,py,yml,vim} setlocal softtabstop=2 tabstop=2 shiftwidth=2 expandtab
endif

" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

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

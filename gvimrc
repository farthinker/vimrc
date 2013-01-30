set guifont=Menlo\ Regular:h12
set linespace=2
set antialias

" Don't beep
set visualbell

set guioptions-=T   " No toolbar
set guioptions-=r   " No scrollbars

if has("gui_macvim")
  set invmacmeta  

  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  macmenu &File.New\ Tab key=<nop>
  macmenu &Tools.Spelling.To\ Next\ error key=<nop>

end

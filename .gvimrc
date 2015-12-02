"----------------------------------------------------------
" MacVim用
"----------------------------------------------------------
" 文字コードの指定
set enc=utf-8
set fenc=utf-8
set fencs=iso-2022-jp,utf-8,euc-jp,cp932

" 背景色設定
set background=dark

" yankしたらクリップボードに送る
set clipboard=unnamed,autoselect

" leader key setting
map ¥ <leader>

" font
set guifont=Ricty\ for\ Powerline:h15

" window size
set lines=90 columns=100

" hide toolbar
set guioptions-=T
let g:molokai_original = 1

" hi Visual guibg=#909090 ctermbg=#808080

" ファイルのディレクトリに移動する
autocmd BufEnter * execute 'lcd ' fnameescape(expand('%:p:h'))

" colorscheme for MacVim
" colorscheme solarized
" colorscheme wombat
color Dracula

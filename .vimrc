"
"                                ___           ___           ___
"      ___                      /\  \         /\  \         /\__\
"     /\  \        ___         |::\  \       /::\  \       /:/  /
"     \:\  \      /\__\        |:|:\  \     /:/\:\__\     /:/  /
"      \:\  \    /:/__/      __|:|\:\  \   /:/ /:/  /    /:/  /  ___
"  ___  \:\__\  /::\  \     /::::|_\:\__\ /:/_/:/__/___ /:/__/  /\__\
" /\  \ |:|  |  \/\:\  \__  \:\~~\  \/__/ \:\/:::::/  / \:\  \ /:/  /
" \:\  \|:|  |   ~~\:\/\__\  \:\  \        \::/~~/~~~~   \:\  /:/  /
"  \:\__|:|__|      \::/  /   \:\  \        \:\~~\        \:\/:/  /
"   \::::/__/       /:/  /     \:\__\        \:\__\        \::/  /
"    ~~~~           \/__/       \/__/         \/__/         \/__/
"
""" vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" 
Bundle 'unite.vim'
Bundle 'unite-colorscheme'
Bundle 'neocomplcache'
Bundle 'quickrun.vim'
Bundle 'sudo.vim'
Bundle 'eregex.vim'
Bundle 'yanktmp.vim'
Bundle 'YankRing.vim'
Bundle 'Align'
Bundle 'Puppet-Syntax-Highlighting'
Bundle 'ref.vim'
Bundle 'ack.vim'
" Bundle 'snipMate'
Bundle 'tpope/vim-rails'
Bundle 'ruby-matchit'
Bundle 'surround.vim'
Bundle 'smartchr'
" Bundle 'Markdown'
Bundle 'tangledhelix/vim-octopress'
Bundle 'matchit.zip'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'

filetype plugin indent on
"-----------------------------------------------------------------------------
""" changelog
"
let changelog_user = system("echo -n ${USER} @ `hostname -s`")
let g:changelog_timeformat = "%Y-%m-%d"
let g:changelog_username = changelog_user
"-----------------------------------------------------------------------------

""" 一般
" マシン固有の設定は.vimrc.localに用意して読み込む
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
" コマンド、検索パターンを50個まで履歴に残す
set history=50
" 256色化
set t_Co=256
" colorscheme
colorscheme molokai
let g:molokai_original = 1
"-----------------------------------------------------------------------------

""" 検索関連
"
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索文字列入力時に順次対象文字列にヒットさせない
set noincsearch
" Esc連打で検索時にハイライトを消す
nmap <Esc><Esc> :nohlsearch<CR><Esc>
"-----------------------------------------------------------------------------

""" 装飾関連
"
"行番号を表示させない
set nonumber
" タイトルをウインドウ枠に表示
set title
" ルーラーを表示
set ruler
" タブや改行を表示しない
set nolist
" 入力中のコマンドをステータスに表示する
set showcmd
" 括弧入力時の対応する括弧を表示
set showmatch
" 補完候補をリスト表示
set wildmenu

" ステータスラインを常に表示
set laststatus=2
" ステータスラインに表示する情報の指定
function! GetB()
    let c = matchstr(getline('.'), '.', col('.') - 1)
    let c = iconv(c, &enc, &fenc)
    return String2Hex(c)
endfunction
" :help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
    let n = a:nr
    let r = ""
    while n
        let r = '0123456789ABCDEF'[n % 16] . r
        let n = n / 16
    endwhile
    return r
endfunc
" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
    let out = ''
    let ix = 0
    while ix < strlen(a:str)
        let out = out . Nr2Hex(char2nr(a:str[ix]))
        let ix = ix + 1
    endwhile
    return out
endfunc

"ステータスラインに文字コードと改行文字を表示する
" set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']['.&ft.']'}\ %F%=%l,%c%V%8P
if winwidth(0) >= 120
    set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=[%{GetB()}]\ %l,%c%V%8P
else
    set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=[%{GetB()}]\ %l,%c%V%8P
endif

"set statusline=%{GetB()}
"
" set statusline=[%n]%1*%m%*%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=[%<%{fnamemodify(getcwd(),':~')}]%-8([%{GetB()}]%)\ %-11(%l,%c%V%)\ %4P

" ステータスラインの色
" hi StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white
" ハイライト
if &t_Co > 2 || has("gui_running")
    " シンタックスハイライトを有効にする
    syntax on
    " 検索結果文字列のハイライトを有効にする
    set hlsearch
endif
"-----------------------------------------------------------------------------

""" 編集、文書整形関連
"
" backspaceキーの挙動を設定する
" indent        : 行頭の空白の削除を許す
" eol           : 改行の削除を許す
" start         : 挿入モードの開始位置での削除を許す
set backspace=indent,eol,start
" 新しい行を直前の行と同じインデントにする
set autoindent
" Tab文字を画面上の見た目で何文字幅にするか設定
set tabstop=4
" cindentやautoindent時に挿入されるタブの幅
set shiftwidth=4
" Tabキー使用時にTabでは無くホワイトスペースを入れたい時に使用する
" この値が0以外の時はtabstopの設定が無効になる
set softtabstop=0
" タブの入力を空白文字に置き換える
set expandtab

"-----------------------------------------------------------------------------

""" ファイル関連
"
" nobackup
" バックアップファイルを作成しない
set nobackup
"-----------------------------------------------------------------------------

""" マップ定義
"
""" yanktmp
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>"
"-----------------------------------------------------------------------------

""" オートコマンド
"
if has("autocmd")
    " プラグインを有効
    filetype plugin on
    " textファイルのカラムを78に設定
    autocmd FileType text setlocal textwidth=78
    " カーソル位置を記憶しておく
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
    "そのファイルタイプにあわせたインデントを利用する
    filetype indent on
    " これらのftではインデントを無効に
    "autocmd FileType php filetype indent off

    " autocmd FileType php :set indentexpr=
    autocmd FileType html :set indentexpr=
    autocmd FileType xhtml :set indentexpr=

    "html記述用
    autocmd BufNewFile *.html 0r ~/.vim/templates/skel.html
    
    "Perl記述用
    autocmd BufNewFile *.pl 0r ~/.vim/templates/skel.pl
    "perl コンパイラの指定
    autocmd FileType perl,cgi :compiler perl
    
    "sh記述用
    autocmd BufNewFile *.sh 0r ~/.vim/templates/skel.sh
    
    "Python記述用
    autocmd BufNewFile *.py 0r ~/.vim/templates/skel.py
    autocmd FileType python let g:pydiction_location = '~/.vim/pydiction/complete-dict'
    autocmd FileType python setl autoindent
    autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4

    "Ruby記述用
    autocmd BufNewFile *.rb 0r ~/.vim/templates/skel.rb

endif " has("autocmd")

"-----------------------------------------------------------------------------
"-----------------------------------------------------------------------------

""" プラグイン関連
" Python
function! s:Exec()
    exe "!" . &ft . " %"        
:endfunction         
command! Exec call <SID>Exec() 
map <silent> <C-P> :call <SID>Exec()<CR>

" notime
augroup InsModeAu
    autocmd!
    autocmd InsertEnter,CmdwinEnter * set noimdisable
    autocmd InsertLeave,CmdwinLeave * set imdisable
augroup END

""" neocomplcache
let g:neocomplcache_enable_at_startup = 1
"highlight Pmenu ctermbg=8 guibg=#606060
"highlight PmenuSel ctermbg=12 guibg=SlateBlue
"highlight PmenuSbar ctermbg=0 guibg=#404040
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4
highlight String     ctermfg=brown guifg=Orange cterm=none gui=none
highlight MatchParen guifg=Yellow guibg=DarkCyan
highlight SignColumn guibg=#101020
highlight CursorIM   guifg=NONE guibg=Red
highlight CursorLine guifg=NONE guibg=#505050

" 自作snippets用ディレクトリを用意
let g:NeoComplCache_SnippetsDir  =  $HOME . '/.vim/snippets'

" <C-k> にマッピング http://vim-users.jp/2010/11/hack185/
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

"-----------------------------------------------------------------------------

""" Unite 
" The prefix key.
" https://github.com/Shougo/unite.vim/blob/master/doc/unite.jax
nnoremap    [unite]   <Nop>
nmap    f [unite]

nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
nnoremap  [unite]f  :<C-u>Unite source<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.

  nmap <buffer> <ESC>      <Plug>(unite_exit)
  imap <buffer> jj      <Plug>(unite_insert_leave)
  "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

  " <C-l>: manual neocomplcache completion.
  inoremap <buffer> <C-l>  <C-x><C-u><C-p><Down>

  " Start insert.
  "let g:unite_enable_start_insert = 1
endfunction"}}}

let g:unite_source_file_mru_limit = 200
let g:unite_cursor_line_highlight = 'TabLineSel'
let g:unite_abbr_highlight = 'TabLine'

" For optimize.
let g:unite_source_file_mru_filename_format = ''
"-----------------------------------------------------------------------------
""" smartchr
autocmd FileType php,python inoremap <expr> = smartchr#one_of(' = ', ' == ', ' === ', '=')
autocmd FileType ruby inoremap <expr> = smartchr#one_of(' = ', ' == ', '=')
autocmd FileType ruby inoremap <expr> > smartchr#one_of(' > ', ' => ', '>')
autocmd FileType ruby inoremap <expr> <buffer> { smartchr#loop('{', '#{', '{{{')
"-----------------------------------------------------------------------------


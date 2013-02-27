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

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/unite.vim'
NeoBundle 'unite-colorscheme'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimproc'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'sudo.vim'
NeoBundle 'eregex.vim'
NeoBundle 'yanktmp.vim'
NeoBundle 'YankRing.vim'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'Puppet-Syntax-Highlighting'
NeoBundle 'thinca/vim-ref'
NeoBundle 'ack.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'ruby-matchit'
NeoBundle 'surround.vim'
NeoBundle 'smartchr'
NeoBundle 'tangledhelix/vim-octopress'
NeoBundle 'matchit.zip'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
NeoBundle 'ctrlp.vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'glidenote/octoeditor.vim'
NeoBundle 'sgur/ctrlp-extensions.vim'
NeoBundle 'spolu/dwm.vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'thinca/vim-template'
NeoBundle 'godlygeek/tabular'
NeoBundle 'fholgado/minibufexpl.vim'

" colorscheme
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'

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
" Mac用の設定を用意
if has('mac')
  source ~/.vimrc.mac
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
nnoremap <Esc><Esc> :nohlsearch<CR>
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

" ハイライト
if &t_Co > 2 || has("gui_running")
  " シンタックスハイライトを有効にする
  syntax on
  " 検索結果文字列のハイライトを有効にする
  set hlsearch
endif

" 80文字以上をハイライトhttp://vim-users.jp/2011/05/hack217/
set textwidth=0
if exists('&colorcolumn')
    set colorcolumn=+1
    " sh,perl,vim,...の部分は自分が使う
    " プログラミング言語のfiletypeに合わせてください
    autocmd FileType sh,perl,vim,ruby,python setlocal textwidth=80
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
map <silent> sP :call YanktmpPaste_P()<CR>
"-----------------------------------------------------------------------------

""" autocmd
"
if has("autocmd")
  " textファイルのカラムを78に設定
  autocmd FileType text setlocal textwidth=78
  " カーソル位置を記憶しておく
  autocmd BufReadPost *
              \ if line("'\"") > 0 && line("'\"") <= line("$") |
              \   exe "normal g`\"" |
              \ endif
  " これらのftではインデントを無効に
  "autocmd FileType php filetype indent off

  " 自動でコメントアウトされないように
  autocmd FileType * setlocal formatoptions-=ro

  " autocmd FileType php :set indentexpr=
  autocmd FileType html :set indentexpr=
  autocmd FileType xhtml :set indentexpr=

  " Indent
  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType html       setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType eruby      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vb         setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType puppet     setlocal sw=2 sts=2 ts=2 et
endif " has("autocmd")

"-----------------------------------------------------------------------------
"-----------------------------------------------------------------------------

""" プラグイン関連
" notime
augroup InsModeAu
  autocmd!
  autocmd InsertEnter,CmdwinEnter * set noimdisable
  autocmd InsertLeave,CmdwinLeave * set imdisable
augroup END

""" neocomplcache
let g:neocomplcache_enable_at_startup = 1
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4
highlight String     ctermfg=brown guifg=Orange cterm=none gui=none
highlight MatchParen guifg=Yellow guibg=DarkCyan
highlight SignColumn guibg=#101020
highlight CursorIM   guifg=NONE guibg=Red
highlight CursorLine guifg=NONE guibg=#505050

" 自作snippets用ディレクトリを用意
let g:NeoComplCache_SnippetsDir = $HOME . '/.vim/snippets'

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
nnoremap <silent> [unite]u  :<C-u>UniteWithBufferDir -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]b  :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
nnoremap <silent> [unite]l  :<C-u>Unite colorscheme<CR>
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

" For vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
nnoremap <silent> <Leader>e :<C-u>VimFilerBufferDir<CR>

" For optimize.
let g:unite_source_file_mru_filename_format = ''
"-----------------------------------------------------------------------------

""" smartchr
autocmd FileType php,python inoremap <expr> <buffer> = smartchr#one_of(' = ', ' == ', ' === ', '=')
"autocmd FileType ruby inoremap <expr> = smartchr#one_of(' = ', ' == ', '=')
autocmd FileType ruby inoremap <expr> <buffer> > smartchr#one_of(' > ', ' => ', '>')
autocmd FileType ruby inoremap <expr> <buffer> { smartchr#loop('{', '#{', '{{{')
"-----------------------------------------------------------------------------

""" For yankring.vim
let g:yankring_manual_clipboard_check = 0
"-----------------------------------------------------------------------------

""" For memolist.vim
let g:memolist_qfixgrep = 1
nnoremap <Leader>ml  :MemoList<CR>
nnoremap <Leader>mn  :MemoNew<CR>
nnoremap <Leader>mg  :MemoGrep<CR>
nnoremap mf  :FufFile <C-r>=expand(g:memolist_path."/")<CR><CR>
nnoremap ,mf :exe "CtrlP" g:memolist_path<cr><f5>
nnoremap <silent> ;ml :Unite file:<C-r>=g:memolist_path."/"<CR><CR>
"-----------------------------------------------------------------------------

""" For ctrlp
let g:ctrlp_by_filename         = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_working_path_mode   = 2
let g:ctrlp_highlight_match     = [1, 'IncSearch']
set wildignore+=*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\.git$\|\.svn$\|\.neocon$'
let g:ctrlp_extensions = ['cmdline', 'yankring', 'menu']
"-----------------------------------------------------------------------------

""" For ocotoeditor.vim
let g:octopress_path = '~/octopress'
let g:octopress_prompt_categories = 1
let g:octopress_qfixgrep = 1
nnoremap <Leader>on  :OctopressNew<CR>
nnoremap <Leader>ol  :OctopressList<CR>
nnoremap <Leader>og  :OctopressGrep<CR>
nnoremap ,og  :OctopressGenerate<CR>
nnoremap ,od  :OctopressDeploy<CR>
nnoremap of  :FufFile <C-r>=expand(g:octopress_path."/source/_posts/")<CR><CR>
nnoremap ,of :exe "CtrlP" g:octopress_path . "/source/_posts/"<cr><f5>
"-----------------------------------------------------------------------------

""" For Gist.vim
let g:gist_detect_filetype = 1
"-----------------------------------------------------------------------------

""" minibufexpl
" 表示をトグル
nnoremap gbb :TMiniBufExplorer<CR>
" 表示してフォーカスを一覧にもってくる
nnoremap gbg :MiniBufExplorer<CR>
" 勝手に開くバッファ数
let g:miniBufExplorerMoreThanOne = 0
"-----------------------------------------------------------------------------

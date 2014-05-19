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
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
\     'cygwin'  : 'make -f make_cygwin.mak',
\     'mac'     : 'make -f make_mac.mak',
\     'unix'    : 'make -f make_unix.mak',
\   },
\ }
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'sudo.vim'
NeoBundle 'eregex.vim'
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
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'glidenote/octoeditor.vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'thinca/vim-template'
NeoBundle 'godlygeek/tabular'
NeoBundle 'rking/ag.vim'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle "kien/ctrlp.vim"
NeoBundle "evanmiller/nginx-vim-syntax"
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'vim-scripts/vim-auto-save'
NeoBundle 'mattn/benchvimrc-vim'
NeoBundle 'Shougo/neomru.vim'

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

" check new plugin
" NeoBundleCheck

"------------------------------------------
" for neocomplete and neocomplcache
"------------------------------------------
if has("lua")
  NeoBundleLazy 'Shougo/neocomplete', { 'autoload' : {
  \   'insert' : 1,
  \ }}
endif

function! s:meet_neocomplete_requirements()
  return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
endfunction

if s:meet_neocomplete_requirements()
  NeoBundle 'Shougo/neocomplete.vim'
  NeoBundleFetch 'Shougo/neocomplcache.vim'
else
  NeoBundleFetch 'Shougo/neocomplete.vim'
  NeoBundle 'Shougo/neocomplcache.vim'
endif

if s:meet_neocomplete_requirements()
  " 新しく追加した neocomplete の設定
  let g:neocomplete#enable_at_startup = 1
  imap <C-k> <Plug>(neocomplete#snippets_expand)
  smap <C-k> <Plug>(neocomplete#snippets_expand)
  inoremap <expr><C-g>     neocomplcache#undo_completion()
  inoremap <expr><C-l>     neocomplcache#complete_common_string()
else
  " 今までの neocomplcache の設定
  let g:neocomplcache_enable_at_startup = 1
  " <C-k> にマッピング http://vim-users.jp/2010/11/hack185/
  imap <C-k> <Plug>(neocomplcache_snippets_expand)
  smap <C-k> <Plug>(neocomplcache_snippets_expand)
  inoremap <expr><C-g>     neocomplcache#undo_completion()
  inoremap <expr><C-l>     neocomplcache#complete_common_string()
endif
"-----------------------------------------------------------------------------

filetype plugin indent on
"-----------------------------------------------------------------------------
""" changelog
"
" let changelog_user         = system("echo -n ${USER} @ `hostname -s`")
let g:changelog_timeformat = "%Y-%m-%d"
" let g:changelog_username   = changelog_user
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
" 変なファイルが出来ないようにする
set noundofile

" ステータスラインを常に表示
set laststatus=2

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
  autocmd FileType sh         setlocal sw=2 sts=2 ts=2 et
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

" highlight 
highlight Pmenu ctermbg=0
highlight PmenuSel ctermfg=255 ctermbg=4
highlight PMenuSbar ctermbg=8
highlight PmenuThumb ctermbg=5
highlight CursorLine term=reverse cterm=none ctermbg=4

" notime
augroup InsModeAu
  autocmd!
  autocmd InsertEnter,CmdwinEnter * set noimdisable
  autocmd InsertLeave,CmdwinLeave * set imdisable
augroup END

" 自作snippets用ディレクトリを用意
let g:neosnippet#snippets_directory = $HOME . '/.vim/snippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"-----------------------------------------------------------------------------

""" ctrlp.vim
let g:ctrlp_use_migemo = 1
let g:ctrlp_use_caching = 1
let g:ctrlp_lazy_update = 0
let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|.cache)$',
  \ 'file': '\v\.(mp3|mp4|jpg|png|pdf|zip|m4a|pkg|gz|ttf|mov|avi|dmg|rar|xls|mobi)$',
  \ }
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")':   ['<c-n>', '<down>','<c-j>'],
  \ 'PrtSelectMove("k")':   ['<c-p>', '<up>','<c-k>'],
  \ 'PrtHistory(-1)':       [''],
  \ 'PrtHistory(1)':        [''],
  \ }

""" Unite 
" The prefix key.
" https://github.com/Shougo/unite.vim/blob/master/doc/unite.jax
" http://mba-hack.blogspot.jp/2013/03/unitevim.html
nnoremap    [unite]   <Nop>
nmap    <Space>u [unite]

nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]u  :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> [unite]b  :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
nnoremap <silent> [unite]l  :<C-u>Unite colorscheme -auto-preview<CR>
nnoremap  [unite]f  :<C-u>Unite source<CR>
nnoremap <silent> ,e  :<C-u>Unite file_rec/async:! -start-insert<CR>

let g:unite_source_rec_max_cache_files = 5000
let g:unite_source_file_mru_limit      = 200

let g:unite_cursor_line_highlight      = 'TabLineSel'
let g:unite_abbr_highlight             = 'TabLine'

" For vimfiler
let g:vimfiler_as_default_explorer     = 1
let g:vimfiler_safe_mode_by_default    = 0
nnoremap <silent> <Leader>e :<C-u>VimFilerBufferDir<CR>
autocmd FileType vimfiler 
  \ nnoremap <buffer><silent>/ 
  \ :<C-u>Unite file -default-action=vimfiler<CR>

" For optimize.
let g:unite_source_file_mru_filename_format = ''
"-----------------------------------------------------------------------------

""" smartchr
autocmd FileType php,python inoremap <expr> <buffer> = smartchr#one_of(' = ', ' == ', ' === ', '=')
"autocmd FileType ruby inoremap <expr> = smartchr#one_of(' = ', ' == ', '=')
autocmd FileType ruby inoremap <expr> <buffer> > smartchr#one_of(' > ', ' => ', '>')
autocmd FileType ruby inoremap <expr> <buffer> { smartchr#loop('{', '#{', '{{{')
"-----------------------------------------------------------------------------

""" For vim-over
nnoremap <silent> ,m :OverCommandLine<CR>%s/
"-----------------------------------------------------------------------------

""" For memolist.vim
let g:memolist_qfixgrep = 1
nnoremap <Leader>ml  :MemoList<CR>
nnoremap <Leader>mn  :MemoNew<CR>
nnoremap <Leader>mg  :MemoGrep<CR>
nnoremap mf  :FufFile <C-r>=expand(g:memolist_path."/")<CR><CR>
nnoremap <silent> ;ml :Unite file:<C-r>=g:memolist_path."/"<CR><CR>
" let g:memolist_unite = 1
" let g:memolist_unite_source = "file_rec"
" let g:memolist_unite_option = "-start-insert"
" nnoremap <silent> mg :<C-u>Unite grep:<C-r>=expand(g:memolist_path."/")<CR><CR>
"-----------------------------------------------------------------------------

""" For ocotoeditor.vim
let g:octopress_path              = '~/octopress'
let g:octopress_prompt_categories = 1
let g:octopress_qfixgrep          = 1
nnoremap <Leader>on  :OctopressNew<CR>
nnoremap <Leader>ol  :OctopressList<CR>
nnoremap <Leader>og  :OctopressGrep<CR>
nnoremap ,og  :OctopressGenerate<CR>
nnoremap ,od  :OctopressDeploy<CR>
nnoremap of  :FufFile <C-r>=expand(g:octopress_path."/source/_posts/")<CR><CR>
nnoremap <silent> og :<C-u>Unite grep:<C-r>=expand(g:octopress_path."/source/_posts/")<CR><CR>
"-----------------------------------------------------------------------------

""" For Gist.vim
let g:gist_detect_filetype = 1
"-----------------------------------------------------------------------------

""" For vim-auto-save refs http://qiita.com/kentaro/items/833075356d41e9d9bc75
let g:auto_save = 1
"-----------------------------------------------------------------------------
" for yankround.vim {{{
"" キーマップ
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
nnoremap <silent><SID>(ctrlp) :<C-u>CtrlP<CR>
nmap <expr><C-p> yankround#is_active() ? "\<Plug>(yankround-prev)" : "<SID>(ctrlp)"
"" 履歴取得数
let g:yankround_max_history = 50
""履歴一覧(kien/ctrlp.vim)
nnoremap <Leader><C-p> :<C-u>CtrlPYankRound<CR>
"}}}

""" edit and sorce .vimrc (:Ev,:Rv)
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC
"-----------------------------------------------------------------------------

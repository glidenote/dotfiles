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
set nocompatible
filetype off

if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/vim-plug',
        \ {'dir': '~/.vim/plugged/vim-plug/autoload'}

Plug 'AndrewRadev/switch.vim'
" Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'FuzzyFinder'
Plug 'L9'
Plug 'LeafCage/yankround.vim'
Plug 'Puppet-Syntax-Highlighting'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elzr/vim-json'
Plug 'eregex.vim'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'fuenor/qfixgrep'
Plug 'glidenote/memolist.vim'
Plug 'glidenote/octoeditor.vim'
Plug 'glidenote/roadworker.vim'
Plug 'glidenote/rspec-result-syntax'
Plug 'glidenote/serverspec-snippets'
Plug 'glidenote/vim-chef'
Plug 'godlygeek/tabular'
Plug 'h1mesuke/vim-alignta'
Plug 'itchyny/lightline.vim'
Plug 'joker1007/vim-markdown-quote-syntax'
Plug 'junegunn/limelight.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'matchit.zip'
Plug 'mattn/benchvimrc-vim'
Plug 'mattn/ctrlp-ghq'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'moll/vim-node'
Plug 'osyo-manga/vim-over'
Plug 'rcmdnk/vim-markdown'
Plug 'rhysd/clever-f.vim'
Plug 'rking/ag.vim'
Plug 'ruby-matchit'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'smartchr'
Plug 'sudo.vim'
Plug 'surround.vim'
Plug 'thinca/vim-quickrun'
Plug 'thinca/vim-ref'
Plug 'thinca/vim-template'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'vim-jp/vim-go-extra'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-terraform'
Plug 'vim-voom/VOoM'
" Plug 'chef.vim'
" Plug 'tangledhelix/vim-octopress'

" colorscheme
Plug 'altercation/vim-colors-solarized'
Plug 'jonathanfilip/vim-lucius'
Plug 'jpo/vim-railscasts-theme'
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'
Plug 'vim-scripts/Wombat'
Plug 'vim-scripts/rdark'
Plug 'vim-scripts/twilight'
Plug 'w0ng/vim-hybrid'
Plug 'zenorocha/dracula-theme'

if has('mac')
  Plug 'restart.vim'
  Plug 'tyru/open-browser.vim'
  Plug 'tyru/open-browser-github.vim'
endif

let g:neocomplete#enable_at_startup = 1
imap <C-k> <Plug>(neocomplete#snippets_expand)
smap <C-k> <Plug>(neocomplete#snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

call plug#end()

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
" 保存しないでもbuffer切り替えする
set hidden
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
" 7.4以降で変なファイルが出来ないようにする
if v:version > 740
  set noundofile
endif
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
  autocmd FileType css        setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType html       setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType eruby      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
endif " has("autocmd")

"-----------------------------------------------------------------------------
"-----------------------------------------------------------------------------

""" プラグイン関連

" syntastic with rubocop
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_check_on_wq = 0

" markdown http://mattn.kaoriya.net/software/vim/20140523124903.htm
let g:markdown_fenced_languages = [
\  'erb=eruby',
\  'json=javascript',
\  'ruby',
\  'sql',
\  'sh',
\]

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
let g:neosnippet#snippets_directory = [
      \'~/.vim/snippets',
      \'~/.vim/plugged/serverspec-snippets',
      \]

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
let g:ctrlp_cmd                 = 'CtrlPMRUFiles'
let g:ctrlp_by_filename         = 1
" let g:ctrlp_use_migemo          = 1
let g:ctrlp_use_caching         = 1   " 0が無効/1が有効
let g:ctrlp_lazy_update         = 0
let g:ctrlp_show_hidden         = 1
let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
" let g:ctrlp_working_path_mode   = 'ra'
" let g:ctrlp_open_new_file       = 'r'
let g:ctrlp_match_window        = 'bottom,order:btt,min:1,max:25'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|neocon|neocomplcache|neocomplete|cache)$',
  \ 'file': '\v\.(mp3|mp4|jpg|png|pdf|zip|m4a|pkg|gz|ttf|mov|avi|dmg|rar|xls|mobi)$',
  \ }
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")':   ['<c-n>', '<down>','<c-j>'],
  \ 'PrtSelectMove("k")':   ['<c-p>', '<up>','<c-k>'],
  \ 'PrtHistory(-1)':       [''],
  \ 'PrtHistory(1)':        [''],
  \ }
let g:ctrlp_extensions = ['mixed']
nmap    <Space>m :CtrlPMRU<CR>
noremap <leader>g :<c-u>CtrlPGhq<cr>
"-----------------------------------------------------------------------------
""" smartchr
autocmd FileType php,python inoremap <expr> <buffer> = smartchr#one_of(' = ', ' == ', ' === ', '=')
autocmd FileType go inoremap <expr> <buffer> = smartchr#one_of('=', ' := ',  ' == ', ' != ')
"autocmd FileType ruby inoremap <expr> = smartchr#one_of(' = ', ' == ', '=')
autocmd FileType ruby,eruby inoremap <expr> <buffer> > smartchr#one_of(' > ', ' => ', '>')
autocmd FileType ruby,eruby inoremap <expr> <buffer> { smartchr#loop('{', '#{', '{{{')
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
"-----------------------------------------------------------------------------
""" For Gist.vim
let g:gist_detect_filetype = 1
"-----------------------------------------------------------------------------

""" For vim-auto-save refs http://qiita.com/kentaro/items/833075356d41e9d9bc75
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1
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
"-----------------------------------------------------------------------------
" for alingta
vnoremap <silent> => :Align @1 =><CR>
vnoremap <silent> = :Align @1 =<CR>
vnoremap <silent> == =
"-----------------------------------------------------------------------------
" for Voom
nnoremap <silent> <leader>v :Voom markdown<CR>
"-----------------------------------------------------------------------------
" for serverspec-snippets
command! SS set filetype=ruby.serverspec
"-----------------------------------------------------------------------------
""" edit and sorce .vimrc (:Ev,:Rv)
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC
"-----------------------------------------------------------------------------
" for sudo.vim
command! W w sudo:%
""" edit /etc/hosts
command! Eh edit /etc/hosts
"-----------------------------------------------------------------------------
" for surround.vim ()http://rcmdnk.github.io/blog/2014/05/03/computer-vim-octopress/)
nmap <Leader>{ ysiw{
nmap <Leader>} ysiw}
nmap <Leader>[ ysiw[
nmap <Leader>] ysiw]
nmap <Leader>( ysiw(
nmap <Leader>) ysiw)
nmap <Leader>b ysiwb
nmap <Leader>< ysiw<
nmap <Leader>> ysiw>
nmap <Leader>" ysiw"
nmap <Leader>' ysiw'
nmap <Leader>` ysiw`
nmap <Leader>* ysiw*
nmap <Leader><Leader>* ysiw*wysiw*
xmap { S{
xmap } S}
xmap [ S[
xmap ] S]
xmap ( S(
xmap ) S)
xmap < S<
xmap > S>
xmap " S"
xmap ' S'
xmap ` S`
xmap * S*
xmap <Leader>* S*gvS*
"-----------------------------------------------------------------------------
" Vimの便利な画面分割＆タブページ http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
nnoremap s <Nop>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sn gt
nnoremap sp gT
"-----------------------------------------------------------------------------
" custom lightline https://github.com/itchyny/lightline.vim
"-----------------------------------------------------------------------------
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component': {
  \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ },
  \ 'separator': { 'left': '⮀', 'right': '⮂' },
  \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
  \ }

nnoremap <silent> <leader>cf :ChefFindAny<CR>
nnoremap <silent> <leader>cs :ChefFindAnySplit<CR>
nnoremap <silent> <leader>cv :ChefFindAnyVsplit<CR>
nnoremap <silent> <leader>cr :ChefFindRelated<CR>

"-----------------------------------------------------------------------------
" for vim-json
let g:vim_json_syntax_conceal = 0
"-----------------------------------------------------------------------------
" for golang http://mattn.kaoriya.net/software/vim/20130531000559.htm
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview
if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
endif
autocmd BufWritePre *.go Fmt
"-----------------------------------------------------------------------------
" ctrlp-ghq https://github.com/mattn/ctrlp-ghq
let ctrlp_ghq_default_action = 'e'
let g:ctrlp_ghq_cache_enabled = 0
let g:ctrlp_ghq_actions = [
\ {"label": "Open", "action": "e", "path": 1},
\ {"label": "Look", "action": "!ghq look", "path": 0},
\]

"-----------------------------------------------------------------------------
" plasticboy/vim-markdown
let g:vim_markdown_folding_disabled=1
"-----------------------------------------------------------------------------
" remove the end of line space
autocmd BufWritePre * :%s/\s\+$//ge
"-----------------------------------------------------------------------------
" NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"-----------------------------------------------------------------------------
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    vmap <expr> <Esc>[200~ XTermPasteBegin("c")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif

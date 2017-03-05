" plug-in manager
let s:dein_dir = expand('~/.vim/bundles')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &compatible
  set nocompatible
endif
if !isdirectory(s:dein_repo_dir)
  execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir
call dein#begin(s:dein_dir)
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('jistr/vim-nerdtree-tabs')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('Yggdroot/indentLine')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('tyru/caw.vim')
call dein#add('rhysd/accelerated-jk')
:
call dein#end()

if dein#check_install()
  call dein#install()
endif
filetype plugin indent on

" scrooloose/nerdtree
" 不可視ファイルを表示する
let NERDTreeShowHidden = 1
" ツリーと編集領域を移動する
nmap <Leader><Tab> <C-w>w

" ファイルが指定されていなければNERD treeを有効にする
if argc() == 0
  let g:nerdtree_tabs_open_on_console_startup = 1
end

" ファイル保存時に余分なスペースを削除する
autocmd BufWritePre * :FixWhitespace

" 検索モードを開く
nmap <Leader>f :CtrlP<CR>

" コメントの追加・削除を行なう
nmap <Leader>/ <Plug>(caw:zeropos:toggle)
vmap <Leader>/ <Plug>(caw:zeropos:toggle)

" j/kによる移動を速くする
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" 自動補完機能を有効にする
let g:neocomplete#enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set nocompatible
" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
"set noswapfile
" swapがある時はread-onlyで開く
augroup swapchoice-readonly
  autocmd!
  autocmd SwapExists * let v:swapchoice = 'o'
augroup END
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
"コードの色分け
syntax on
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
"set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
"set virtualedit=onemore
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
set matchtime=1
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
"補間メニューの高さ
set pumheight=10
" 不可視文字を表示
set list
" カーソル行の上下へのオフセットを設定する
set scrolloff=6
" カーソル行の左右へのオフセットを設定する
set sidescrolloff=12
" 256色設定
set t_Co=256
" 暗い背景
"set background=dark
" カラースキーマ
"colorscheme solarized
colorscheme molokai


" Tab系
" 不可視文字を可視化(タブが「?-」と表示される)
set list listchars=tab:\?\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" インデントはスマートインデント
set smartindent
" 改行時に前の行のインデントを継続する
set autoindent

" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
" コマンドラインの履歴を10000件保存する
set history=10000

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>


" backspace
set backspace=start,eol,indent
" delete  refs: http://vim-jp.org/vimdoc-ja/options.html#:fixdel
fixdel
" 行末ヤンク
nnoremap Y y$
" 数字のインクリメント(+)、デクリメント(-)
nnoremap + <C-a>
nnoremap - <C-x>
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" 検索によるハイライト表示を解除する
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

" <Leader>バインド
let mapleader = "\<Space>"




"setting.vim
"------------------------------------------------------------
"検索関係
"------------------------------------------------------------

"検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が
"混在しているときは区別する
set ignorecase
set smartcase

"検索結果をハイライト表示
set hlsearch

"逐次検索をオン
set incsearch

"Kでカーソル下の単語のhelpを引く
set keywordprg=:help

"------------------------------------------------------------
"編集関係
"------------------------------------------------------------

"タブ設定
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set shiftround

"オートインデント
set autoindent
set smartindent
let delimitMate_expand_cr = 1
"オートインデント、改行、インサートモード開始直後にバックスペースキーで
"削除できるようにする。
set backspace=indent,eol,start

"検索時にファイルの下まで行ったら上まで戻る
set wrapscan

"閉じ括弧入力時に対応している括弧が画面内にある場合に、一瞬開き括弧にジャンプ
set showmatch

"対応括弧のハイライト表示を0.1秒に
set matchtime=1

"コマンドライン補完を便利に
set wildmenu

"テキスト挿入の自動折り返しに日本語を対応
set formatoptions+=mM

"移動コマンドを使ったとき、行頭に移動しない
set nostartofline

"バッファが変更されているとき、コマンドをエラーにするのでなく、
"保存するかどうか確認を求める
set confirm

"ビジュアルモードで文字の無いところにもカーソル移動を可能に
set virtualedit=block

"キーコードはすぐにタイムアウト
set notimeout

"マッピングは200ms待つ
set ttimeout ttimeoutlen=200

"スワップファイルを作らない
set noswapfile

"バックアップファイルを作らない
set nobackup

"undoファイルを作らない
set noundofile

"クリップボードを他のアプリと共有
set clipboard+=unnamedplus

"対応括弧を追加
set matchpairs& matchpairs+=<:>

"スペルチェック時に日本語を除外
set spelllang=en,cjk

"ファイルを開いた時に，カーソル位置を最後にカーソルがあった位置まで移動
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"------------------------------------------------------------
"表示関係
"------------------------------------------------------------

"行番号を表示
set number

"ルーラ表示
set ruler

"タブや改行を非表示
set nolist

"マルチバイト文字の表示をいいかんじに
set ambiwidth=double

"折り返し
set wrap

"長い行も表示
set display=lastline

"ステータスラインを常に表示する
set laststatus=2

"コマンドラインの高さを2行に
set cmdheight=2

"タイプ途中のコマンドを画面最下行に表示
set showcmd

"タイトル表示
set title

"カーソル行を可視化
set cursorline

"ビープの代わりにビジュアルベル(画面フラッシュ)を使う
set visualbell

"ビジュアルベルも無効化する
set t_vb=

"フォールディング設定
set foldmethod=marker

" デフォルト不可視文字は美しくないのでUnicodeで綺麗に
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲

"カーソルが内行の内容を隠蔽しない
set conceallevel=0

"補完メニューの幅
set pumheight=15

"カーソルの表示を変更
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=2

" カラースキーム
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax enable
" colorscheme tender
" let g:lightline = { 'colorscheme': 'tender' }
" let g:airline_theme = 'tender'
colorscheme molokai

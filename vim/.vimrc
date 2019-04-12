" Note: Skip initialization for vim-tiny or vim-small.

if 0 | endif
 
 " ファイルに関する設定など
 " 文字コードをUTF8に設定  
 set fenc=utf-8
 
 " バックアップファイルを作らない
 set nobackup
 
 " スワップファイルを作らない
 set noswapfile
 
 " 編集中のファイルが変更されたら自動で読み直す
 set autoread
 
 " バッファが編集中でもその他のファイルを開けるように
 set hidden

 " 見た目系
 " 入力中のコマンドをステータスに表示する
 set showcmd
 
 " 行番号を表示
 set number
 
 " 行末の1文字先までカーソルを移動できるように
 set virtualedit=onemore
 
 " インデントはスマートインデント
 autocmd FileType java setl smartindent cinwords=if,"else if",else,for,while,class,{
 autocmd FileType c setl smartindent cinwords=if,"else if",else,for,while,do,switch,{
 autocmd FileType tex setl smartindent cinwords=\begin                         
 
 " クリップボードからのコピペによるインデントのズレを解消
 " F11で貼り付けモード、F12で解除
 imap <F12> :set paste
 imap <F11> :set nopaste

 " カラースキーム変更
 syntax on
 colorscheme molokai
 set t_Co=256

 " ビープ音を可視化
 set visualbell
 
 " 括弧入力時の対応する括弧を表示
 set showmatch
 
 " ステータスラインを常に表示
 set laststatus=2
 
 " Anywhere SID.
 function! s:SID_PREFIX()
   return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
 endfunction

 " Set tabline.
 " The prefix key.
 function! s:my_tabline()  "{{{
   let s = ''
   for i in range(1, tabpagenr('$'))
     let bufnrs = tabpagebuflist(i)
     let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
     let no = i  " display 0-origin tabpagenr.
     let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
     let title = fnamemodify(bufname(bufnr), ':t')
     let title = '[' . title . ']'
     let s .= '%'.i.'T'
     let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
     let s .= no . ':' . title
     let s .= mod
     let s .= '%#TabLineFill# '
   endfor
   let s .= '%#TabLineFill#%T%=%#TabLine#'
   return s
 endfunction "}}}
 let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
 set showtabline=2 " 常にタブラインを表示
 
 " Tab jump
 nnoremap    [Tag]   <Nop>
 nmap    t [Tag]
 " t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
 for n in range(1, 9)
   execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
 endfor
 
 " tc 新しいタブを一番右に作る
 map <silent> [Tag]c :tablast <bar> tabnew<CR>
 " tx タブを閉じる
 map <silent> [Tag]x :tabclose<CR>
 " tn 次のタブ
 map <silent> [Tag]n :tabnext<CR>
 " tp 前のタブ
 map <silent> [Tag]p :tabprevious<CR>
 

 " コマンドラインの補完
 set wildmode=list:longest
 
 " 折り返し時に表示行単位での移動できるようにする
 nnoremap j gj
 nnoremap k gk
 
 " Tab系
 " Tab文字を半角スペースにする
 set expandtab
 
 " 行頭以外のTab文字の表示幅（スペースいくつ分）
 set tabstop=4
 
 " 行頭でのTab文字の表示幅
 set shiftwidth=4

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
 
 " 入力系
 " 自動補完(ファイル内探索)
 set completeopt=menuone
 for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
     exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
 endfor

  " コメントアウト(Ctrl + l)
 autocmd FileType java imap <silent> <C-l> <Esc>0i// 
 autocmd FileType c imap <silent> <C-l> <Esc>0i// 
 autocmd FileType cpp imap <silent> <C-l> <Esc>0i// 
 autocmd FileType ruby imap <silent> <C-l> <Esc>0i# 
 autocmd FileType python imap <silent> <C-l> <Esc>0i#  
 autocmd FileType tex imap <silent> <C-l> <Esc>0i% 
 autocmd FileType vim imap <silent> <C-l> <Esc>0i<Space>" 

 " 
 imap () ()<Left>
 imap {} {}<Left>
 imap "" ""<Left>
 imap <> <><Left>
 imap [] []<Left>
 imap '' ''<Left>
 imap $$ $$<Left>
    
 "Backpaceが効かなくならないために
 set backspace=indent,eol,start

 " NeoBundleの設定 
 " Required
 set nocompatible
 filetype plugin indent off
 
 " Required
 if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim
   call neobundle#begin(expand('~/.vim/bundle'))
 endif 
 
 " pluginはすべてここに！！
 NeoBundleFetch 'Shougo/neobundle.vim'
 NeoBundle 'Shougo/unite.vim'   " unite.vimの設定
 NeoBundle 'scrooloose/nerdtree'
 NeoBundle 'Shougo/neosnippet.vim'
 NeoBundle 'Shougo/vimfiler'
 NeoBundle 'tpope/vim-fugitive' " gitの設定
 NeoBundle 'thinca/vim-quickrun'
 NeoBundle 'thinca/vim-localrc'
 NeoBundle 'grep.vim'
 NeoBundle 'scrooloose/syntastic'

 " Unit.vimの設定""""""""""""""""""""""""""""""" 
 " 最近使ったファイルを表示できるようにする
 NeoBundle 'Shougo/neomru.vim' 
 " 入力モードで開始する
 let g:unite_enable_start_insert=1
 " バッファ一覧
 noremap <C-P> :Unite buffer<CR>
 " ファイル一覧
 noremap <C-N> :Unite -buffer-name=file file<CR>
 " 最近使ったファイルの一覧
 noremap <C-Z> :Unite file_mru<CR>
 " sourcesを「今開いているファイルのディレクトリ」とする
 noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
 
 " ウィンドウを分割して開く
 au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
 au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
 " ウィンドウを縦に分割して開く
 au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
 au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
 " ESCキーを2回押すと終了する
 au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
 au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
 """""""""""""""""""""""""""""

 " Nerdtree(ツリー型ファイル管理)の設定
 map <C-t> :NERDTreeToggle<CR>
 
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
 
 " バッファ間移動 
 map <silent> <S-h> <C-w>h
 map <silent> <S-j> <C-w>j
 map <silent> <S-k> <C-w>k
 map <silent> <S-l> <C-w>l
 
 " QuickRunの設定
 map <silent> <C-q> :QuickRun<CR>

 " Required
 call neobundle#end()
 filetype plugin indent on


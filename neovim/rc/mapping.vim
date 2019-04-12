"mapping.vim

"Yの動作をDやCと同じにする
map Y y$

"<ESC>2回で検索後の強調表示を解除する
nnoremap <ESC><ESC> :nohl<CR><C-L>

"j k を表示行移動できるよう変更
nnoremap j gj
nnoremap k gk

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

".vimrcを開く
nnoremap ,ev :tabe $HOME/.vimrc<CR>

".vimrcを再読み込み
nnoremap ,rv :source $HOME/.vimrc<CR>

"ヤンクした文字列でカーソル位置の単語を置換
nnoremap <silent> cy  ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy  c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> ciy  ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

"ウィンドウ幅の変更
nnoremap + 5<C-W>+
nnoremap _ 5<C-W>-
nnoremap > 5<C-W>>
nnoremap < 5<C-W><

" バッファ間移動 
map <silent> <S-h> <C-w>h
map <silent> <S-j> <C-w>j
map <silent> <S-k> <C-w>k
map <silent> <S-l> <C-w>l

" ESC でノーマルモードに 
imap <silent> jj <ESC>

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" タブの設定
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


"ビジュアルモードでインデント変更後に再選択
vnoremap <  <gv
vnoremap >  >gv

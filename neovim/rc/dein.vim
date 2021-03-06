" dein.vim
" プラグイン管理

" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

filetype plugin indent on

" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイルを用意しておく
  let g:toml_dir    = expand("~/.config/nvim/dein/")
  let s:plugins     = g:toml_dir . '/plugins.toml'
  let s:lazy = g:toml_dir . '/lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:plugins, {'lazy': 0})
  call dein#load_toml(s:lazy, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

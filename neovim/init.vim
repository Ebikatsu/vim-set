" Neovim Setting

"init.vim
let g:home = expand('~')
let g:vim_home = g:home .'/.config/nvim'
let g:rc_dir   = g:vim_home . '/rc'

"分割したファイルを読み込み
function s:load_rc(file)
  execute 'source ' . g:rc_dir . '/' . a:file . '.vim'
endfunction

if filereadable(expand(g:rc_dir . '/dein.vim'))
    call s:load_rc('dein')
endif

if filereadable(expand(g:rc_dir .  '/settings.vim'))
    call s:load_rc('settings')
endif

if filereadable(expand(g:rc_dir . '/mapping.vim'))
    call s:load_rc('mapping')
endif

if filereadable(expand(g:rc_dir . '/color.vim'))
    call s:load_rc('color')
endif

if filereadable(expand(g:rc_dir . '/filetype.vim'))
    call s:load_rc('filetype')
endif

if filereadable(expand(g:rc_dir . '/nerdtree.vim'))
    call s:load_rc('nerdtree')
endif

if filereadable(expand(g:rc_dir . '/R.vim'))
    call s:load_rc('R')
endif

if filereadable(expand(g:rc_dir . '/japaniese.vim'))
    call s:load_rc('japaniese')
endif

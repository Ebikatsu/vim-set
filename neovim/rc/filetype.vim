"filetypes.vim
"ファイルタイプに関係する設定
augroup filetypeds
    autocmd!
    autocmd BufNewFile,BufRead,BufReadPre *.{md,mkd,mark*} set filetype=markdown
    autocmd BufNewFile,BufRead,BufReadPre *.{json} set filetype=json conceallevel=0
    autocmd InsertEnter *.json setlocal conceallevel=0 concealcursor=
    autocmd InsertLeave *.json setlocal conceallevel=0 concealcursor=inc
    autocmd BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
    autocmd BufRead,BufNewFile *.scss set filetype=scss.css
    autocmd FileType scss set iskeyword+=-
augroup END

augroup load_templates
    autocmd!
    let s:load_templates_dir='~/.config/nvim/template'
    let s:load_templates_command="0r " . s:load_templates_dir
    autocmd BufNewFile *.html    execute s:load_templates_command . "/template.html"
    autocmd BufNewFile *.c       execute s:load_templates_command . "/template.c"
    autocmd BufNewFile *.cpp     execute s:load_templates_command . "/template.cpp"
    autocmd BufNewFile *.java    execute s:load_templates_command . "/template.java"
    autocmd BufNewFile *.py      execute s:load_templates_command . "/template.py"
    autocmd BufNewFile *.rb      execute s:load_templates_command . "/template.rb"
    autocmd BufNewFile *.tex     execute s:load_templates_command . "/template.tex"
    autocmd BufNewFile *.sh      execute s:load_templates_command . "/template.sh"
augroup END

"augroup miss_file_name
"    autocmd!
"    autocmd BufNewFile *. if isdirectory(*.java) execute :e *.java
"augroup END


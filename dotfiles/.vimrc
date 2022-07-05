" ## General
set nocompatible
set backspace=indent,eol,start


" ## Visual
set number
set ruler


" ## Spell
" This will work only on commit messages.
" https://thoughtbot.com/blog/vim-spell-checking
au BufNewFile,BufRead COMMIT_EDITMSG set spell textwidth=72
set complete+=kspell " word completion with CTRL-N or CTRL-P
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red " Change style of error highlight


" ## Swap/Backups
set noswapfile
set nobackup
set nowb

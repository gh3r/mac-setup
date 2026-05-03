" ## General
set nocompatible
set hidden " allow switching buffers without saving
set confirm " prompt instead of failing on unsaved changes
set autoread " reload files changed outside vim
set backspace=indent,eol,start
syntax on

" ## Editing
set expandtab
set shiftwidth=2
set tabstop=2
set smartindent

" ## Visual
set number
" set relativenumber
set ruler
set cursorline
set colorcolumn=80
set scrolloff=10
" set wildmode=longest,list

colorscheme habamax

" ## Status Line
set statusline=
set statusline+=%#StatusMode#
set statusline+=\ %{toupper(mode())}\ 
set statusline+=%*
set statusline+=\ %t\ [%{&filetype}]
set statusline+=%m
set statusline+=%=
set statusline+=\ %p%%
set statusline+=\ %l:%c

set laststatus=2

" ## Color overwrites
highlight ColorColumn ctermbg=236 guibg=#2a2a2a
highlight CursorLine cterm=NONE ctermbg=236
highlight StatusMode ctermfg=black ctermbg=yellow guifg=#1f1f1f guibg=#d97706

" ## Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" ## Completion
set complete+=kspell
set completeopt=menu,menuone,noselect

" ## Spell (Git Commit Messages)
" This will work only on commit messages.
" https://thoughtbot.com/blog/vim-spell-checking
augroup gitcommit_spell
  autocmd!
  autocmd FileType gitcommit setlocal spell spelllang=en textwidth=72 colorcolumn=73 wrap
augroup END

set complete+=kspell " word completion with CTRL-N or CTRL-P

hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red " Change style of error highlight

" ## Undo (persistent undo)
set undofile

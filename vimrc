
" Enable modern Vim features not compatible with Vi spec.
set nocompatible

" Enable file type based indent configuration and syntax highlighting.
" Note that when code is pasted via the terminal, vim by default does not detect
" that the code is pasted (as opposed to when using vim's paste mappings), which
" leads to incorrect indentation when indent mode is on.
" To work around this, use ":set paste" / ":set nopaste" to toggle paste mode.
" You can also use a plugin to:
" - enter insert mode with paste (https://github.com/tpope/vim-unimpaired)
" - auto-detect pasting (https://github.com/ConradIrwin/vim-bracketed-paste)
filetype plugin indent on
filetype plugin on

syntax on

set nu
set mouse=a

set splitbelow
set splitright

map <C-j> <PageDown>
map <C-k> <PageUp>

map <C-S-Up> ddkkp
map <C-S-Down> ddp

set colorcolumn=81
highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

" vim-plug plugin manager
"  ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdcommenter'

" Initialize plugin system
call plug#end()

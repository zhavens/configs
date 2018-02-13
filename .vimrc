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

let mapleader = ','

set colorcolumn=81
highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

" Automatically strip whitespace from source files
autocmd FileType c,h,cpp,java,py autocmd BufWritePre <buffer> %s/\s\+$//e

" vim-plug plugin manager
"  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Reload Vim:
"  :PlugInstall
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" Initialize plugin system
call plug#end()

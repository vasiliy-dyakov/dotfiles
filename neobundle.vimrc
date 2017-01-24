filetype off             " Turn off filetype plugins before bundles init

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let g:neobundle#types#git#clone_depth = 1

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" BUNDLES (plugins administrated by NeoBundle) {{{

" Vimproc to asynchronously run commands (NeoBundle, Unite)
NeoBundle 'Shougo/vimproc', {
            \ 'build' : {
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }

" Unite. The interface to rule almost everything
NeoBundle 'Shougo/unite.vim'

if has('lua')
  NeoBundle 'Shougo/neocomplete'
else
  NeoBundle 'Shougo/neocomplcache'
endif
" NeoBundle 'Shougo/neosnippet'
NeoBundle 'tpope/vim-fugitive'
NeoBundleLazy 'gregsexton/gitv', {'depends':['tpope/vim-fugitive'],
            \ 'autoload':{'commands':'Gitv'}}
NeoBundle 'airblade/vim-gitgutter'

" snippets
NeoBundle 'sirver/ultisnips'

NeoBundle 'mbbill/undotree' " shows all undo tree

NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-lastpat' "a/ i/ highlighted text
NeoBundle 'kana/vim-textobj-fold' "az folding
NeoBundle 'kana/vim-textobj-entire' "ae ie current buffer
NeoBundle 'glts/vim-textobj-comment' "ac current comment
NeoBundle 'tpope/vim-abolish' ":%S/{dog,man}/{man,dog}
NeoBundle 'yegappan/mru' "history files
" NeoBundle 'scrooloose/syntastic'
NeoBundle 'w0rp/ale'
NeoBundle 'rking/ag.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'vim-scripts/tlib'
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'severin-lemaignan/vim-minimap'
NeoBundle 'ap/vim-css-color'
" NeoBundle 'kien/rainbow_parentheses.vim'
" NeoBundle 'nathanaelkane/vim-indent-guides'
" NeoBundle 'yggdroot/indentline'

NeoBundleLazy 'othree/html5.vim', { 'autoload': { 'filetypes': ['html', 'css'] } }

NeoBundle 'gregsexton/MatchTag'
NeoBundle 'hail2u/vim-css3-syntax'

" CSS/LESS
NeoBundle 'groenewege/vim-less'
" END BUNDLES }}}

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

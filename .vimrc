scriptencoding utf-8

set nocompatible

" NEOBUNDLE {{{ ===============================================================

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
NeoBundle 'scrooloose/syntastic'
NeoBundle 'rking/ag.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-scripts/tlib'

NeoBundleLazy 'othree/html5.vim', { 'autoload': { 'filetypes': ['html', 'css'] } }

NeoBundle 'gregsexton/MatchTag'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'ignovak/vim-web-indent'

" CSS/LESS
NeoBundle 'groenewege/vim-less'
" END BUNDLES }}}

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" }}}

syntax on

set mouse=a
let mapleader = "\<space>"

" General options
set exrc secure             " Enable per-directory .vimrc files and disable unsafe commands in them

" Buffer options
set hidden                  " hide buffers when they are abandoned
set autoread                " auto reload changed files

" reloads all buffers on switching between windows, tabs, and cursor move
au FocusGained,BufEnter,CursorHold * :silent! checktime
" au FocusLost,WinLeave,CursorHold * :silent! w

" Display options
set title                   " show file name in window title
set novisualbell            " mute error bell
set list
set listchars=tab:⇥\ ,trail:·,extends:⋯,precedes:⋯,nbsp:~
set linebreak               " break lines by words
set scrolljump=5
set sidescroll=4
set sidescrolloff=10
set showcmd
set whichwrap=b,s,<,>,[,],l,h
set completeopt=menu,preview
set infercase
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set ttyfast                 " Optimize for fast terminal connections
set shortmess=atI           " Don’t show the intro message when starting Vim
set nostartofline
set number                  " Show line numbers

set wrap

" Edit
set backspace=indent,eol,start " Allow backspace to remove indents, newlines and old tex"
" set virtualedit=block
set iskeyword+=-
set nobackup
set nowritebackup
set noswapfile
set binary
set eol
set suffixesadd=.js         " to open files without extension (es6 modules, requirejs, etc)

" Tab options
set autoindent              " copy indent from previous line
set smartindent             " enable nice indent
set smarttab                " indent using shiftwidth"
set expandtab               " tab with spaces
set shiftwidth=4            " number of spaces to use for each step of indent
set tabstop=4
set softtabstop=4           " tab like 4 spaces
set shiftround              " drop unused spaces

" Search options
set gdefault                " Add the g flag to search/replace by default
set hlsearch                " Highlight search results
set ignorecase              " Ignore case in search patterns
set smartcase               " Override the 'ignorecase' option if the search pattern contains upper case characters
set incsearch               " While typing a search command, show where the pattern
nnoremap <silent> <cr> :nohlsearch<cr><cr>

" Matching characters
set showmatch               " Show matching brackets
set matchpairs+=<:>         " Make < and > match as well

" Localization
set langmenu=none            " Always use english menu
set keymap=russian-jcukenmac " Alternative keymap
set langmap=ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,фa,ыs,вd,аf,пg,рh,оj,лk,дl,яz,чx,сc,мv,иb,тn,ьn,ж\\;,Ж\\:,б\\,ю.,Б\\<,Ю\\>,э\\',Э\\",х\\[,Х\\{,ъ\\],Ъ\\}

set iminsert=0               " English by default
set imsearch=-1              " Search keymap from insert mode
" set spell
set encoding=utf-8           " Default encoding
set fileencodings=utf-8,cp1251,koi8-r,cp866
set termencoding=utf-8
set fileformats=unix,dos,mac

" Wildmenu
set wildmenu                " use wildmenu ...
set wildcharm=<TAB>

" Folding
if has('folding')
    set foldmethod=indent
    set foldlevel=99
endif

set diffopt=filler
set diffopt+=vertical
set diffopt+=iwhite

set laststatus=2
set statusline=%F

augroup vimrc
  autocmd!

  autocmd FileType vim setlocal sw=2
  autocmd FileType vim setlocal ts=2
  autocmd FileType vim setlocal sts=2

  " Auto reload vim settings
  autocmd BufWritePost *.vim source $MYVIMRC
  autocmd BufWritePost .vimrc source $MYVIMRC

  " Restore cursor position
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
              \| exe "normal g'\"" | endif

  " Filetypes
  autocmd FileType scss set ft=scss.css
  autocmd FileType less set ft=less.css
  autocmd! FileType sass,scss syn cluster sassCssAttributes add=@cssColors

  autocmd BufRead,BufNewFile *.json set ft=javascript
  " autocmd BufRead,BufNewFile *.json set equalprg=python\ -mjson.tool
  autocmd BufRead,BufNewFile *.js set ft=javascript.javascript-jquery

  " Avoid syntax-highlighting for files larger than 10MB
  autocmd BufReadPre * if getfsize(expand("%")) > 10000*1024 | syntax off | endif

  autocmd BufReadPost fugitive://* set bufhidden=delete

  " NeoComplete, Neosnippet
  " Auto close preview window
  " autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
  " autocmd InsertLeave * if pumvisible() == 0|pclose|endif
  " autocmd InsertLeave * NeoSnippetClearMarkers

augroup END

" set t_Co=256
" let g:solarized_termcolors=256
" let g:solarized_contrast='high'
" let g:solarized_termtrans=1

" set background=light
colorscheme solarized

" Unite

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('file_rec,file_rec/async,grep', 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/', 'node_modules/', 'libs/', 'log/'], '\|'))
call unite#custom#source('file_rec,file_rec/async', 'max_candidates', 10000)

let g:unite_source_buffer_time_format = ''
" let g:unite_enable_start_insert = 1
" let g:unite_split_rule = "botright"
" let g:unite_force_overwrite_statusline = 0
" let g:unite_winheight = 10
" let g:unite_candidate_icon="▷"

nmap <leader> [unite]
nnoremap [unite] <nop>

if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden -S'
    let g:unite_source_grep_recursive_opt=''
    let g:unite_source_grep_search_word_highlight = 1
elseif executable('ack')
    let g:unite_source_grep_command='ack'
    let g:unite_source_grep_default_opts='--no-group --no-color'
    let g:unite_source_grep_recursive_opt=''
    let g:unite_source_grep_search_word_highlight = 1
endif

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=0

" delimitMate
let delimitMate_matchpairs = '(:),[:],{:}'
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

" Neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

if has('lua')

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplete#close_popup()
  inoremap <expr><C-e>  neocomplete#cancel_popup()

else

  " Define keyword.
  if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplcache#undo_completion()
  inoremap <expr><C-l>     neocomplcache#complete_common_string()

  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplcache#close_popup()
  inoremap <expr><C-e>  neocomplcache#cancel_popup()

endif

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" Neosnippet
" " Plugin key-mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)
"
" " SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: "\<TAB>"
"
" " For snippet_complete marker.
" if has('conceal')
"   set conceallevel=2 concealcursor=i
" endif
"
" let g:neosnippet#disable_runtime_snippets = {
"       \   '_' : 1,
"       \ }
"
" " Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1
"
" " Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/.vim/snippets'

" custom mapping
nnoremap <silent> <leader>t :tabnew<cr>
nnoremap <silent> <leader>x :close<cr>
nnoremap <silent> <leader>q :tabclose<cr>
nnoremap <silent> <leader>w :w<cr>
" reload if changed
nnoremap <silent> <leader>r :checktime<cr>
nnoremap <leader>f mM:Ag<space>
nnoremap <leader>d (Odebugger;<cr>
nnoremap <leader>u :UndotreeToggle<cr>
nnoremap <leader>G :Gitv<cr>
" git diff
nnoremap <silent> <leader>g :Gdiff<cr>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" nnoremap <silent> <leader>> :diffget<cr>
" nnoremap <silent> <leader>< :diffput<cr>
nnoremap <silent> <leader>2 :diffget //2<cr>
nnoremap <silent> <leader>3 :diffget //3<cr>
" :current open
nnoremap <silent> <leader>o :<C-u>Unite -auto-resize -buffer-name=buffers buffer<cr>
" :browse oldfiles
nnoremap <silent> <leader>O :Mru<cr>
nnoremap <silent> <leader>j :tabnext<cr>
nnoremap <silent> <leader>k :tabprev<cr>
nnoremap <silent> <leader>l :tabmove +1<cr>
nnoremap <silent> <leader>h :tabmove -1<cr>
nnoremap <silent> g1 1gt
nnoremap <silent> g2 2gt
nnoremap <silent> g3 3gt
nnoremap <silent> g4 4gt
nnoremap <silent> g4 4gt
nnoremap <silent> g5 5gt
nnoremap <silent> g6 6gt
nnoremap <silent> g7 7gt
nnoremap <silent> g8 8gt
nnoremap <silent> g9 9gt
nnoremap <silent> g$ :tablast<cr>
nnoremap <silent> <leader>S :setlocal spell spelllang=ru_ru,en_us<cr>
nnoremap <silent> <leader>s :SyntasticToggleMode<cr>
" work with system buffer
vmap <leader>y "+y
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

nmap <silent> <leader><space> :NERDTreeFind<CR>
nmap <silent> <leader>c :NERDTreeClose<CR>

" fugitive
nmap <silent> <leader>a :.Gblame<cr>
nmap <silent> <leader>A :Gblame<cr>

"Search visual selection by *
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
nnoremap <silent> <leader>/ :<C-u>call <SID>SetSearch()<CR>/<C-R>=@/<CR><CR>
function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction
function! s:SetSearch()
    let @/ = '\V' . substitute(escape(@+, '/\'), '\n', '\\n', 'g')
endfunction

"CtrlP
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Helpers for snipmate
" so ~/.vim/snippets/support_functions.vim

" Slime-vim
" Typical settings for tmux:
" socket: "default"
" pane: ":0.1"
if executable('tmux')
    let g:slime_target = "tmux"
endif
xmap gx <Plug>SlimeRegionSend
" WARN: netrwPlugin has the same mapping
nmap gx <Plug>SlimeParagraphSend

let g:goog_user_conf = {
            \ 'langpair': 'en|ru',
            \ 'v_key': 'T'
            \ }

if has('gui_running')
    source ~/.vim/.gvimrc
endif

function! SQLUpperCase()
    %s:\<analyze\>\|\<and\>\|\<as\>\|\<by\>\|\<desc\>\|\<exists\>\|\<explain\>\|\<from\>\|\<group\>\|\<in\>\|\<insert\>\|\<intersect\>\|\<into\>\|\<join\>\|\<limit\>\|\<not\>\|\<on\>\|\<order\>\|\<select\>\|\<set\>\|\<update\>\|\<where\>:\U&:i
endfunction

"ultiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsEditSplit="vertical"

hi StatusLine cterm=none ctermfg=7 ctermbg=black
hi StatusLineNC cterm=none ctermfg=white ctermbg=black
hi VertSplit cterm=none ctermfg=black ctermbg=black
hi TabLineFill cterm=none ctermfg=white ctermbg=black
hi TabLine cterm=none ctermfg=white ctermbg=black
hi TabLineSel cterm=none ctermfg=black ctermbg=220
hi Title cterm=none ctermfg=none ctermbg=none
hi MatchParen cterm=none ctermfg=white ctermbg=5
hi Visual cterm=none ctermfg=white ctermbg=38
hi IncSearch cterm=none ctermfg=black ctermbg=220
hi Search cterm=none ctermfg=white ctermbg=5

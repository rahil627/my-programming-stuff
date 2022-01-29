
" automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif




call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.

" themes
"bg=dark/light
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'https://github.com/sainnhe/everforest.git'
Plug 'https://github.com/sainnhe/gruvbox-material.git'
Plug 'https://github.com/sainnhe/sonokai.git'
Plug 'https://github.com/romainl/flattened.git'
"colorscheme flattened_light/dark




" main list
" see https://vimawesome.com for a list of pop plugins
" data gathered from actual vim configs on github! :o

""sensible configs that everyone can agree on"
Plug 'https://github.com/tpope/vim-sensible.git'

" status bar replacement
Plug 'https://github.com/vim-airline/vim-airline'

" a good selection of themes that match the status bar
Plug 'https://github.com/vim-airline/vim-airline-themes'


" press tab to trigger omnicomplete (vim's autocomplete) 
Plug 'ervandew/supertab'

" make omni-complete the default
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" ensure it has precedence
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabClosePreviewOnPopupClose = 1


filetype plugin on
"set omnifunc=syntaxcomplete#Complete
set omnifunc=vaxe#HaxeComplete


" fuzzy finder diretory tree (like NERDTree)
" fuzzy finder diretory tree (like NERDTree)
" this next line didn't work...? :/
"export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git --exclude .vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" map key to open the fzf window
map ; :Files<CR>



" data structure tree
" need ctags installed
" but i couldn't get this one to "make"... :/ https://github.com/universal-ctags/ctags
"Plug 'https://github.com/preservim/tagbar.git'

" autocomplete
"if has('nvim')
"	  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"	    Plug 'Shougo/deoplete.nvim'
"	      Plug 'roxma/nvim-yarp'
"	        Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#auto_complete=1



" language-related stuff
" haxe
" this interacts with many other plugins such as airline and tag bar
" so put it last
Plug 'jdonaldson/vaxe'
set autowrite
let g:airline_statusline_funcrefs = get(g:, 'airline_statusline_funcrefs', [])


" a list of plugins from from https://breuer.dev/blog/top-neovim-plugins

" the CoC autocomplete takes a bit of time to use with haxe
" see https://github.com/vshaxe/vshaxe/issues/328
" which conluced with https://github.com/vshaxe/haxe-language-server#usage-with-neovim

" pair opening 'n closing symbols
Plug 'jiangmiao/auto-pairs'

" shortcuts for text within symbols
Plug 'machakann/vim-sandwich'

" comment stuff from the default mode
Plug 'preservim/nerdcommenter'

" auto-detect-and-set tabs
Plug 'tpope/vim-sleuth'

" git magic, choose one
Plug 'airblade/vim-gitgutter'
" more heavy, but most popular
"Plug 'tpope/vim-fugitive'


call plug#end()




"set config stuff here

"colorscheme seoul256
colorscheme onehalfdark

"don't need with automatic plugin
set tabstop=4
set shiftwidth=4


"map caps lock to escape
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif







" not proper plugins, but still a plugin

" moving around windows: c+h/j/k/l

"function! WinMove(key)
"    let t:curwin = winnr()
"    exec "wincmd ".a:key
"    if (t:curwin == winnr())
"        if (match(a:key,'[jk]'))
"            wincmd v
"        else
"            wincmd s
"        endif
"        exec "wincmd ".a:key
"    endif
"endfunction

"nnoremap <silent> <C-h> :call WinMove('h')<CR>
"nnoremap <silent> <C-j> :call WinMove('j')<CR>
"nnoremap <silent> <C-k> :call WinMove('k')<CR>
"nnoremap <silent> <C-l> :call WinMove('l')<CR>



" config plugins

" config deoplete (autocomplete)
"call deoplete#custom#var('omni', 'functions', {
"	\ 'haxe': ['vaxe#HaxeComplete'] 		   
"	\})


" this one didn't work for me...
"call deoplete#custom#var('omni', 'input_patterns', {
"		    \ 'haxe': '[^. *\t]\.\w*'
"		    \})

" but i found this one in a github issues thread
" ..and it works!!
"call deoplete#custom#option('omni_patterns', {
"      \ 'haxe': '[^. *\t]\.\w*'
"	  \})




"{{ Auto-completion related
""""""""""""""""""""""""""""" deoplete settings""""""""""""""""""""""""""
" Wheter to enable deoplete automatically after start nvim
"let g:deoplete#enable_at_startup = 1
"
" " Maximum candidate window width
" call deoplete#custom#source('_', 'max_menu_width', 80)
"
" " Minimum character length needed to activate auto-completion,
" " see https://goo.gl/QP9am2
" call deoplete#custom#source('_', 'min_pattern_length', 1)
"
" " Whether to disable completion for certain syntax
" " call deoplete#custom#source('_', {
" "     \ 'filetype': ['vim'],
" "     \ 'disabled_syntaxes': ['String']
" "     \ })
" call deoplete#custom#source('_', {
"     \ 'filetype': ['python'],
"         \ 'disabled_syntaxes': ['Comment']
"             \ })
"
" THIS ONE IS USEFUL
" Ignore certain sources, because they only cause nosie most of the time
"            " around, buffer, tag
"                    call deoplete#custom#option('ignore_sources', {
"                    \ '_': ['around', 'buffer', 'tag'],
"                    \ })
"
"                   " Candidate list item number limit
"                   call deoplete#custom#option('max_list', 30)
"
"                   " The number of processes used for the deoplete parallel
"                   feature.
"                   call deoplete#custom#option('num_processes', 16)
"
"                   " The delay for completion after input, measured in
"                   milliseconds.
"                   call deoplete#custom#option('auto_complete_delay', 100)
"
"                   " Enable deoplete auto-completion
"                   call deoplete#custom#option('auto_complete', v:true)

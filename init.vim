
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
"Plug ‘sainnhe/everforest’
Plug https://github.com/sainnhe/everforest.git
"Plug ‘sainnhe/gruvbox-material’
Plug https://github.com/sainnhe/gruvbox-material.git
Plug https://github.com/sainnhe/sonokai.git
"Plug ‘romainl/flattened’
Plug https://github.com/romainl/flattened.git
"colorscheme flattened_light/dark

" haxe
Plug 'jdonaldson/vaxe'
set autowrite

" fuzzy finder diretory tree (like NERDTree)
export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git --exclude .vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

map ; :Files<CR>

" autocomplete
if has('nvim')
	  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	    Plug 'Shougo/deoplete.nvim'
	      Plug 'roxma/nvim-yarp'
	        Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete=1

" from https://breuer.dev/blog/top-neovim-plugins

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
"Plug 'tpope/vim-fugitive'



call plug#end()


"set config stuff here
"colorscheme seoul256
colorscheme onehalfdark
"set tabstop=4
"set shiftwidth=4



" not proper plugins, but still a plugin

" moving around windows: c+h/j/k/l
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>



" config plugins

" config deoplete (autocomplete)
call deoplete#custom#var('omni', 'functions', {
	\ 'haxe': ['vaxe#HaxeComplete'] 		   
	\})


" this one didn't work for me...
"call deoplete#custom#var('omni', 'input_patterns', {
"		    \ 'haxe': '[^. *\t]\.\w*'
"		    \})

" so...
call deoplete#custom#option('omni_patterns', {
      \ 'haxe': '[^. *\t]\.\w*'
	  \})




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
"             " Ignore certain sources, because they only cause nosie most of
"             the time
"            " around, buffer, tag
"             call deoplete#custom#option('ignore_sources', {
"                \ '_': ['around', 'buffer', 'tag'],
"                   \ })
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

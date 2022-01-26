call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.

" themes
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'NLKNguyen/papercolor-theme'
"Plug ‘sainnhe/everforest’
"Plug ‘sainnhe/gruvbox-material’
"Plug ‘romainl/flattened’

" Haxe Plugin
Plug 'jdonaldson/vaxe'
set autowrite




"autocomplete
if has('nvim')
	  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	    Plug 'Shougo/deoplete.nvim'
	      Plug 'roxma/nvim-yarp'
	        Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete=1



call plug#end()


"set config stuff here
"colorscheme seoul256
colorscheme onehalfdark
set tabstop=4
set shiftwidth=4







"set deoplete (autocomplete)
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

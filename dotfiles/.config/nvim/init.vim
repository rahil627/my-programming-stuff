

"see https://vimawesome.com for vim (not nvim) plugins, it's a really well-designed site!
"see https://github.com/rockerBOO/awesome-neovim#completion for nvim specific plugins, pretty exhaustive
"https://github.com/neovim/neovim/wiki/Related-projects#gui from the main repo's wiki, pretty random

" consult https://vim.fandom.com/wiki/Unused_keys for keys to map



" automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""
" experimenting
"""""""""""""""""""
" a distraction-free mode
" use :Goyo command to enter it
Plug 'junegunn/goyo.vim'




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use the following command to change between light 'n dark themes
" set bg=dark/light
" see the following links on ways to setup colors in terminal
" https://github.com/morhetz/gruvbox/wiki/Terminal-specific
" https://github.com/rakr/vim-one
" a place to get schemes that work with nvim-treesitter syntax highlighting
" also just has some good ones in general
" https://github.com/nvim-treesitter/nvim-treesitter/wiki/Colorschemes
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'junegunn/seoul256.vim'
Plug 'https://github.com/sainnhe/sonokai.git'
Plug 'https://github.com/mhinz/vim-janah.git'
Plug 'rebelot/kanagawa.nvim'
Plug 'NLKNguyen/papercolor-theme'

" testing
Plug 'morhetz/gruvbox'
Plug 'https://github.com/sainnhe/everforest.git'
Plug 'https://github.com/sainnhe/gruvbox-material.git'
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'https://github.com/lifepillar/vim-solarized8.git'
Plug 'https://github.com/rakr/vim-one.git'
" not working... :(
"Plug 'chriskempson/base16-vim'
" just themes for the airline status bar on the bottom, not themes for the whole app
"Plug 'https://github.com/dawikur/base16-vim-airline-themes.git'



" some found on tree-sitter supported themes repo
" many of the above themes might also support tree-sitter
" :Help edge.txt to figure out how to toggle through themes
" also contains themes for most terminal emulators and more
Plug 'https://github.com/sainnhe/edge.git'

Plug 'https://github.com/yonlu/omni.vim.git'

" make sure this next line comes before the plugin
" options: storm (default), night, day
"let g:tokyonight_style = "night"
Plug 'https://github.com/folke/tokyonight.nvim.git'

" darker, lighter, palenight, oceanic, deep ocean
"let g:material_style = "darker"
Plug 'marko-cerovac/material.nvim'

" not even sure how to change the themes within in this one
" Plug 'EdenEast/nightfox.nvim'

" lua only
" https://github.com/rafamadriz/neon.git

" maybe lua only
" https://sr.ht/~novakane/kosmikoa.nvim/


" not tree-sitter supported
" very pleasant to eyes, very dark
"Plug 'tjdevries/colorbuddy.vim'
"Plug 'RishabhRD/nvim-rdark'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" end of themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" main plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" see https://vimawesome.com for a list of pop plugins
" data gathered from actual vim configs on github! :o

""sensible configs that everyone can agree on"
Plug 'https://github.com/tpope/vim-sensible.git'

" status bar replacement
Plug 'https://github.com/vim-airline/vim-airline'

" a good selection of themes that auto-match the status bar
Plug 'https://github.com/vim-airline/vim-airline-themes'





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" a list of plugins from from https://breuer.dev/blog/top-neovim-plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pair opening 'n closing symbols
Plug 'jiangmiao/auto-pairs'

" shortcuts for text within symbols
Plug 'machakann/vim-sandwich'

" comment stuff from the normal mode
Plug 'preservim/nerdcommenter'
" Create default mappings
" cc..., the mappings start with c
" :help nerdocommenter to figure out the rest of the key mappings
let g:NERDCreateDefaultMappings = 1
" optional motions support
"nnoremap <silent> <leader>c} V}:call NERDComment('x', 'toggle')<CR>
"nnoremap <silent> <leader>c{ V{:call NERDComment('x', 'toggle')<CR>

" auto-detect-and-set tabs
" TODO: error with vim-polyglot?
" Plug 'tpope/vim-sleuth'

" git magic, choose one
" TODO: still haven't even used this, but it displays changes nicely :)
" need to somehow stop it from shifting lines tho, and add a column just for this
Plug 'airblade/vim-gitgutter'
" more heavy, but most popular
"Plug 'tpope/vim-fugitive'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" end of a list of plugins from ...top-neovim-plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""




" completion, syntax-highlighter, fuzzy finder, etc.




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" completion plugin that mirrors VS code's completion set-up
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" use :CocConfig to edit the configuration file.
" coc-json will help you provide completion for it :)

" for more extensions including langauges see:
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
" or use this command:
" then run the following commands in nvim: (note: they cannot be done via this config file)
" CocInstall [extension] [extension2]
" :CocUninstall [extension]
" :CocList extensions (from here you can select which extensions to register and unregister)

" To install extensions with shell script, use command like:
" # install coc-json & coc-html and exit
" vim -c 'CocInstall -sync coc-json coc-html|q'

" TODO: maybe add :CocInstall -sync in front of all of these?

" completion sources
" https://github.com/neoclide/coc-sources#readme
" coc-tags
" coc-syntax

" languages

" coc-haxe
" somebody already did the hard work! wooooo
" otherwise:
" the CoC autocomplete takes a bit of time to use with haxe
" see https://github.com/vshaxe/vshaxe/issues/328
" which concluced with https://github.com/vshaxe/haxe-language-server#usage-with-neovim


" coc-solargraph for solargraph (ruby) lang server
" gem install solargraph
" requires to install C compiler stuff because it uses "native extensions"

" coc-sh requires(?) bash using bash-language-server
" coc-fish need fish installed

" TODO: need to check insructions for these 
" markup
" CocInstall coc-yaml coc-json coc-html coc-css
" TODO: find one for markdown

" extensions
" fzf integration options:
" these are both hella powerful
"Plug 'antoinemadec/coc-fzf'
" coc-fzf-preview requires fzf, hella powerful, "This plugin can be easily extended in comparison to fzf.vim."

" coc-git pretty complex stuff, super customizable, "it's recommended to use plugin like vim-fugitive at the same time."

" coc-pairs should not conflict with other plugins...
" coc-yank
" coc-markdownlint for markdown linting
" coc-markdown-preview-enhanced
" coc-dot-complete in case completion is slow or annoying

" coc-gist
" coc-prettier
" coc-snippets
" coc-spell-checker


" to-experiment:
" coc-terminal


" coc-haxe notes:
" https://github.com/vantreeseba/coc-haxe
" haxe.goToHxml jump to the current hxml in the configuration.
" haxe.changeHxml some.hxml tell haxe language server to use another hxml.
" haxe.restart restarts the coc client for haxe language server.
" haxe.printConfig prints the current haxe language server config.



"""""""""""""""""""""""""""""""""""""""""""""""
" old completion stuff, currently using CoC now
"""""""""""""""""""""""""""""""""""""""""""""""
" press tab to trigger omnicomplete (vim's autocomplete) 
"Plug 'ervandew/supertab'

" make omni-complete the default
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" ensure it has precedence
"let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
"let g:SuperTabClosePreviewOnPopupClose = 1

"filetype plugin on
" ...maybe from some other completion plugin?
"set omnifunc=syntaxcomplete#Complete
" get completion from vaxe plugin which gets info form the haxe compiler?
"set omnifunc=vaxe#HaxeComplete
""""""""""""""
" END OF OLD
""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" end of completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



" fuzzy finder (for everything!!)

" fzf
" this next line didn't work...? :/
"export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git --exclude .vim'
" should probably install this using a package manager instead
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" CoC uses Coc-lists, and in order to use fzf, you'd need to use a CoC extension (coc-fzf or something)
" but, i think you can just use this completely seperately too
" then can decide whether to integreate or not
"Plug 'junegunn/fzf.vim'

" map key to open the fzf window
"map ; :Files<CR>

" telescope
" TODO: NOT WORKING?
" more modular, extendable, though perhaps slower(?) than fzf which was written in Go
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" use fzf-native, which is a C impl of fzf, for the sorting algorithm
" supports regex stuff in search, such as * ^ . etc.

" TODO: might need to config fzf.case_mode to "ignore_case", using vimscript tho
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" supports fzf syntax:
"sbtrkt	fuzzy-match	Items that match sbtrkt
"'wild	exact-match (quoted)	Items that include wild
"^music	prefix-exact-match	Items that start with music
".mp3$	suffix-exact-match	Items that end with .mp3
"!fire	inverse-exact-match	Items that do not include fire
"!^music	inverse-prefix-exact-match	Items that do not start with music
"!.mp3$	inverse-suffix-exact-match	Items that do not end with .mp3

" also can use or-operator
"^core go$ | rb$ | py$


" required for live_grep and grep_string
" should install this anyway
Plug 'BurntSushi/ripgrep'





"""""""""""""""""""""""
" data structure tree
"""""""""""""""""""""""

" lsp-based

" vista


" OLD way
" tags-based
" need ctags installed
" universal ctags has a monopoly on this:  https://github.com/universal-ctags/ctags
" just apt install universal-ctags
" then, you must run 'ctags -R' in the source directory
"  a good 'n simple how-to-use: https://andrew.stwrt.ca/posts/vim-ctags/
" for ctags, be sure to copy the ctags language regex code from the vaxe github repo
" and put it in (. or ~)/.ctags.d/something.ctags (NOT ~/.ctags)
"Plug 'https://github.com/preservim/tagbar.git'
"let g:tagbar_width = max([25, winwidth(0) / 5])
"nmap <F8> :TagbarToggle<CR>
" it seemsl ike the blackslash is a modifier key because it waits
"nmap <Bslash> :TagbarToggle<CR>
"alt+number is also good
"nmap . :TagbarToggle<CR>





"""""""""""""""""""""""
" language syntaxes
"""""""""""""""""""""""

" note: CoC doesn't handle syntax-highlighting

" by default, vim comes with a lot, see:
" https://github.com/vim/vim/tree/master/runtime/syntax

" but this one hand-picks repos and fetches the appropriate one based on the file
" includes: haxe (from vaxe) and ruby (from vim-ruby)
Plug 'sheerun/vim-polyglot'
set nocompatible

" tree-sitter, i heard, is better, but takes more effort, but it also covers most languages
" considered experimental and requires newest version of nvim
" https://github.com/nvim-treesitter/nvim-treesitter

" haxe
" this is a fork of the original abandoned haxe tree-sitter repo, 2 commits ahead
" https://github.com/Skehmatics/tree-sitter-haxe
" follow these steps
" https://github.com/nvim-treesitter/nvim-treesitter#adding-parsers
" steal some stuff from here
" https://mzte.de/git/LordMZTE/dotfiles/src/commit/73360c9c1e9fe307f6eba7cf9df2a50deefe26ee/.config/nvim/lua/pluginconf/treesitter.lua
" configs, parser-configs, config.setup




" haxe

" can looks at these haxe gods for some config stuff
" https://github.com/snsvrno/dots/tree/main/.config/nvim
" https://github.com/ZwodahS/vimfiles
" https://gist.github.com/kLabz/ef4713271a67bcb7dc6c980df3cdc6a5


" vaxe
" note: CoC doesn't seem to work without this for some reason...
" vscode language server
" this interacts with many other plugins such as airline and tag bar
" so put it last
" for ctags, be sure to copy the ctags language regex code from the vaxe github repo
" and put it in (. or ~)/.ctags.d/something.ctags (NOT ~/.ctags)
Plug 'jdonaldson/vaxe'
set autowrite
let g:airline_statusline_funcrefs = get(g:, 'airline_statusline_funcrefs', [])

" ruby
" not really sure what this adds in addition to syntax high-lighting...
" Plug 'vim-ruby/vim-ruby'
" in case of problems:
":help vim-ruby-plugin: Filetype settings and custom mappings
":help vim-ruby-indent: Indentation settings
":help vim-ruby-syntax: Syntax-related tweaks
":help vim-ruby-omni: Information and settings for omni completion

" wren
"Plug 'lluchs/vim-wren'





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set config stuff here
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"colorscheme seoul256
colorscheme onehalfdark


""""""""""""""""""""""""""
" basic settings stuff
""""""""""""""""""""""""""

" there's a plugin that probably set some sane default settings already

" CoC provides a lot of these in it's defaults too

" don't need with automatic plugin, but oh well

" use 2 spaces instead of tabs
" https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces
" keep tabs width at 8 so that you can see them easily
set tabstop=8 softtabstop=0

" however, indent (using '<<' and '>>') using two spaces
set shiftwidth=2 smarttab

" make the tab key insert space characters
set expandtab




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key-bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map caps lock to escape
" this might not work, depends on your terminal app
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'






"""""""""""""""""""""""""""""""""""""""""""""""""
" tmux: moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""
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
map <leader>bc :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>bca :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
" add control+t for new tab?
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


"""""""""""""""""""
" editing mappings
"""""""""""""""""""
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" end of tmux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""







"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" might be better to seperate key-mapping from plugin install info for better viewing

" syntax
"[mapKind] [attributes?] [key] [sequence of keys and commands]

" some punctuation keys are un-mapped
" TODO: check
" these are probably the highest valued un-mapped keys
" . , ; and perhaps others
" ; is mapped to fzf file

" the F keys aren't used
" TODO: test all F keys / check key mappings with it all commented out
"map <F1> should go to cheatsheet, or maybe already does?
"map shift+<F1> manual
" telescope manual
"map <F2> ?
"map <F3> prettier?
"map <F4> linter?

" views
" toggle file tree
" shift: telescope on current directory
" toggle class tree
" shift: telescope on LSP symbols

" build and debug
map <F5> :w<CR>:make<CR>
"map <F6> debug stuff?
"map <F7> debug stuff?
"map <F8> debug stuff?

" config 'n plugin managers
"map <F9> should colorscheme get next
"map <S-F9> should colorscheme get previous
" TODO: trash the default colorschemes
map <F10> :CocList
map <S-F10> :CocUpdate
map <F11> :PlugUpdate
map <S-F11> :PlugUpdate
" TODO: does this open a new buffer?
map <F12> :source ~/.config/init.vim<CR>

" examples
"map <F4> "ayy@a<CR>
"map <F6> :filetype detect<CR>
"map <F10> :syntax sync fromstart<CR>
"map <F12> :source ~/.vim/text.vim<CR>






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" config plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""
" telescope
"""""""""""""
" defaults
nnoremap <leader>ff <cmd>Telescope find_files<cr>
"nnoremap <leader>; <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" i added the rest:

" check the site for more "pickers"
" https://github.com/nvim-telescope/telescope.nvim

" search symbols/tags in workspace and document
" for the moment, try using workspace as default
nnoremap <leader>fs <cmd>Telescope lsp_workspace_symbols<cr>
nnoremap <leader>ft <cmd>Telescope lsp_workspace_symbols<cr>
nnoremap <leader>fsiw <cmd>Telescope lsp_workspace_symbols<cr>
nnoremap <leader>ftiw <cmd>Telescope lsp_workspace_symbols<cr>
nnoremap <leader>fsif <cmd>Telescope lsp_document_symbols<cr>
nnoremap <leader>ftif <cmd>Telescope lsp_document_symbols<cr>

" experimenting:

" notes from my own chat
" `builtin.command_history` 🤔
" `builtin.search_history` 🤔 
" hmm, i think fzf is a combo of command history and "reverse" search history...
" sheeeet, i might just hook up most of these pickers 😅 seems like a much more interactive way to learn... fuzzy search vim commands, vim `man` pages, key-mappings, registers.... it's all so much easier with this!!


" fzf basics
nnoremap <leader>fch <cmd>Telescope command_history<cr>
nnoremap <leader>fsh <cmd>Telescope search_history<cr>

" test this against workspace symbols
" find (w)ord or (t)ext?
nnoremap <leader>fw <cmd>Telescope current_buffer_fuzzy_find<cr>


" Using Lua functions
"nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
"nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
"nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
"nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>







"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC defaults
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: keep these for later use, it seems to provide some sane defaults

" https://github.com/neoclide/coc.nvim
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" end of CoC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""





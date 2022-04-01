"see https://vimawesome.com for vim (not nvim) plugins, it's a really well-designed site!
"see https://github.com/rockerBOO/awesome-neovim#completion for nvim specific plugins, pretty exhaustive

" consult https://vim.fandom.com/wiki/Unused_keys for keys to map




" automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif




call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.

" themes
" use the following command to change between light 'n dark themes
" set bg=dark/light
" see the following links on ways to setup colors in terminal
" https://github.com/morhetz/gruvbox/wiki/Terminal-specific
" https://github.com/rakr/vim-one
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'https://github.com/sainnhe/everforest.git'
Plug 'https://github.com/sainnhe/gruvbox-material.git'
Plug 'https://github.com/sainnhe/sonokai.git'
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'https://github.com/lifepillar/vim-solarized8.git'
Plug 'https://github.com/rakr/vim-one.git'
" not working... :(
"Plug 'chriskempson/base16-vim'
" just themes for the airline status bar on the bottom, not themes for the whole app
"Plug 'https://github.com/dawikur/base16-vim-airline-themes.git'

" main list
" see https://vimawesome.com for a list of pop plugins
" data gathered from actual vim configs on github! :o

""sensible configs that everyone can agree on"
Plug 'https://github.com/tpope/vim-sensible.git'

" status bar replacement
Plug 'https://github.com/vim-airline/vim-airline'

" a good selection of themes that match the status bar
Plug 'https://github.com/vim-airline/vim-airline-themes'


" completion plugin that mirrors VS code's completion set-up
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" use :CocConfig to edit the configuration file.
" coc-json will help you provide completion for it :)

" for more extensions including langauges see:
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
" or use this command:
" then run the following commands in nvim: (note: they cannot be done via this config file)
" :CocList extensions
" CocInstall [extension]
" :CocUninstall [extension]


" languages
" coc-haxe
" coc-sh for bash using bash-language-server.
" coc-zig
" coc-json
" coc-html

" extensions
" coc-markdownlint for markdown linting
" coc-markdown-preview-enhanced
" coc-dot-complete
" coc-fzf-preview
" coc-git
" coc-gist
" coc-prettier
" coc-snippets
" coc-spell-checker




" press tab to trigger omnicomplete (vim's autocomplete) 
"Plug 'ervandew/supertab'

" make omni-complete the default
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" ensure it has precedence
"let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
"let g:SuperTabClosePreviewOnPopupClose = 1

filetype plugin on
" ...maybe from some other completion plugin?
"set omnifunc=syntaxcomplete#Complete
" get completion from vaxe plugin which gets info form the haxe compiler?
"set omnifunc=vaxe#HaxeComplete


" fuzzy finder diretory tree (like NERDTree)
" this next line didn't work...? :/
"export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git --exclude .vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" map key to open the fzf window
map ; :Files<CR>



" data structure tree
" need ctags installed
" universal ctags has a monopoly on this:  https://github.com/universal-ctags/ctags
" just apt install universal-ctags
" then, you must run 'ctags -R' in the source directory
"  a good 'n simple how-to-use: https://andrew.stwrt.ca/posts/vim-ctags/
" for ctags, be sure to copy the ctags language regex code from the vaxe github repo
" and put it in (. or ~)/.ctags.d/something.ctags (NOT ~/.ctags)
Plug 'https://github.com/preservim/tagbar.git'
let g:tagbar_width = max([25, winwidth(0) / 5])
"nmap <F8> :TagbarToggle<CR>
" it seemsl ike the blackslash is a modifier key because it waits
"nmap <Bslash> :TagbarToggle<CR>
"alt+number is also good
" hopefully . is okay?
nmap . :TagbarToggle<CR>

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



" language syntaxes

" haxe

" can looks at these two haxe gods for some config stuff
" https://github.com/snsvrno/dots/tree/main/.config/nvim
" https://github.com/ZwodahS/vimfiles

" this interacts with many other plugins such as airline and tag bar
" so put it last
" for ctags, be sure to copy the ctags language regex code from the vaxe github repo
" and put it in (. or ~)/.ctags.d/something.ctags (NOT ~/.ctags)
"Plug 'jdonaldson/vaxe'
"set autowrite
"let g:airline_statusline_funcrefs = get(g:, 'airline_statusline_funcrefs', [])


"wren
Plug 'lluchs/vim-wren'



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


" map caps lock to escape
" TODO: this doesn't work
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'


"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif











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






"config plugins



" CoC defaults
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

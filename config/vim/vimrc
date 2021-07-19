set exrc

"-------------------------------------------------------------------------------
" XDG
"-------------------------------------------------------------------------------
if empty($MYVIMRC) | let $MYVIMRC = expand('<sfile>:p') | endif

if empty($XDG_CACHE_HOME)  | let $XDG_CACHE_HOME  = $HOME."/.cache"       | endif
if empty($XDG_CONFIG_HOME) | let $XDG_CONFIG_HOME = $HOME."/.config"      | endif
if empty($XDG_DATA_HOME)   | let $XDG_DATA_HOME   = $HOME."/.local/share" | endif

set runtimepath^=$XDG_CONFIG_HOME/vim
set runtimepath+=$XDG_DATA_HOME/vim
set runtimepath+=$XDG_CONFIG_HOME/vim/after

set packpath^=$XDG_DATA_HOME/vim,$XDG_CONFIG_HOME/vim
set packpath+=$XDG_CONFIG_HOME/vim/after,$XDG_DATA_HOME/vim/after

let g:netrw_home = $XDG_DATA_HOME."/vim"
call mkdir($XDG_DATA_HOME."/vim/spell", 'p', 0700)
set viewdir=$XDG_DATA_HOME/vim/view | call mkdir(&viewdir, 'p', 0700)

set backupdir=$XDG_CACHE_HOME/vim/backup | call mkdir(&backupdir, 'p', 0700)
set directory=$XDG_CACHE_HOME/vim/swap   | call mkdir(&directory, 'p', 0700)
set undodir=$XDG_CACHE_HOME/vim/undo     | call mkdir(&undodir,   'p', 0700)

if !has('nvim') " Neovim has its own special location
  set viminfofile=$XDG_CACHE_HOME/vim/viminfo
endif

"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------
let g:plug_autoload = $XDG_DATA_HOME."/vim/autoload/plug.vim"
let g:plug_plugged = $XDG_DATA_HOME."/vim/plugged"
if empty(glob(g:plug_autoload))
  execute "!curl -fLo ".g:plug_autoload." --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
endif

call plug#begin(g:plug_plugged)

Plug 'tpope/vim-commentary'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'

Plug 'gruvbox-community/gruvbox'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter'

Plug 'sheerun/vim-polyglot'

Plug 'SirVer/UltiSnips'
Plug 'honza/vim-snippets'

" fugitive
" jiangmiao/auto-pairs

call plug#end()

"-------------------------------------------------------------------------------
" Options
"-------------------------------------------------------------------------------
syntax on
set relativenumber      " Show relative line numbers
set number              " Show current line number instead of 0
set signcolumn=yes      " Show column left to line numbers. Used by gitgutter and linters
set updatetime=250      " Update sign column every quarter second
set colorcolumn=80,120  " Show vertical columns
set mouse=a             " Add mouse support in all modes
set nowrap              " Disable line wrapping

set cursorline          " Highlight the screen line of the cursor

set noshowmode          " Hide INSERT message in last line. Also works for REPLACE and VISUAL

" Center cursor in screen
" https://vim.fandom.com/wiki/Keep_your_cursor_centered_vertically_on_the_screen
set scrolloff=8

set hidden
set noerrorbells

set smartcase
set ignorecase
set incsearch
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set completeopt=menuone,noinsert,noselect " Set completeopt to have a better completion experience
set shortmess+=c " Avoid showing message exta message when using completion

set cmdheight=2

set clipboard=unnamed   " Clipboard support (OSX)
set laststatus=2        " Show status line on startup
set backspace=indent,eol,start

" https://vim.fandom.com/wiki/Highlight_all_search_pattern_matches
" set hlsearch

" Show spaces with a character
" https://superuser.com/questions/921920/display-trailing-spaces-in-vim
" https://vi.stackexchange.com/questions/422/displaying-tabs-as-characters
" I am currently using uncode characters: U+25B8 (▸) and U+00B7 (·)
set list
set listchars+=tab:▸\ ,trail:·

"-------------------------------------------------------------------------------
" Mappings
"-------------------------------------------------------------------------------

" Get off my lawn - helpful when learning Vim :)
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" First mappings
inoremap jk <Esc>
tnoremap jk <C-\><C-n>

let mapleader = " "
nnoremap <Leader>w :write!<CR>
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>so :source %<CR>
nnoremap <Leader>v :edit $MYVIMRC<CR>
nnoremap <Leader>1 :source $MYVIMRC \| :PlugInstall<CR>

" Experimentations
autocmd Filetype c,cpp nnoremap <Leader>c :!cmake --no-warn-unused-cli -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -DCMAKE_BUILD_TYPE:STRING=Release -H. -B./build -G Ninja <CR>
autocmd Filetype c,cpp nnoremap <Leader>b :!cmake --build build --config Debug --target all -- -j 10 <CR>
autocmd Filetype python nnoremap <Leader>b :!python3 %<CR>

"-------------------------------------------------------------------------------
" Colors & Formatting
"-------------------------------------------------------------------------------
" colorscheme gruvbox
" set background=dark
" let g:gruvbox_contrast_dark="hard"

colorscheme onehalfdark
set background=dark
let g:airline_theme='onehalfdark'
"-------------------------------------------------------------------------------
" vim-commentary
"-------------------------------------------------------------------------------
" <C-_> is actually CTRL+/
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>

"-------------------------------------------------------------------------------
" Fuzzy searching
"-------------------------------------------------------------------------------
nnoremap <C-p> :Files<CR>

"-------------------------------------------------------------------------------
" NerdTree
"-------------------------------------------------------------------------------
nnoremap <C-n> :NERDTreeToggle<CR>

"-------------------------------------------------------------------------------
" CocCompletion
"-------------------------------------------------------------------------------
" Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

"-------------------------------------------------------------------------------
" Snippets (UltiSnips & coc-snippets)
"-------------------------------------------------------------------------------
let g:UltiSnipsSnippetDirectories=[$XDG_CONFIG_HOME . '/nvim/snippets']
imap <C-l> <Plug>(coc-snippets-expand)
nnoremap <silent> <C-l> :CocList snippets<CR>

"-------------------------------------------------------------------------------
" Local customizations / overriding
" Source: https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/
"-------------------------------------------------------------------------------
if filereadable($XDG_CONFIG_HOME . '/nvim/local_init.vim')
    source $XDG_CONFIG_HOME/nvim/local_init.vim
endif


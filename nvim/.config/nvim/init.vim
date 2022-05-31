set exrc

"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------
let g:vim_plug = $XDG_DATA_HOME . '/nvim/plugged'
call plug#begin(g:vim_plug)
Plug 'tpope/vim-commentary'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
" For vsnip users
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Rust
" Plug 'neovim/nvim-lspconfig'
" Plug 'simrat39/rust-tools.nvim'

Plug 'nvim-lua/plenary.nvim'
" Plug 'mfussenegger/nvim-dap'

" Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'

" Colorschemes
Plug 'gruvbox-community/gruvbox'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'joshdick/onedark.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git
Plug 'airblade/vim-gitgutter'
" fugitive


Plug 'editorconfig/editorconfig-vim'
" jiangmiao/auto-pairs

call plug#end()

"-------------------------------------------------------------------------------
" Options
"-------------------------------------------------------------------------------
syntax on
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
set completeopt=menuone,menuone,noselect " Set completeopt to have a better completion experience
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
autocmd Filetype python nnoremap <buffer> <Leader>b :!python3 %<CR>

"-------------------------------------------------------------------------------
" Colors & Formatting
"-------------------------------------------------------------------------------
" colorscheme gruvbox
" set background=dark
" let g:gruvbox_contrast_dark="hard"

" colorscheme onehalfdark
" set background=dark
" let g:airline_theme='onehalfdark'

colorscheme onedark
set background=dark
let g:airline_theme='onedark'

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
" Lua
"-------------------------------------------------------------------------------
lua require 'config'

"-------------------------------------------------------------------------------
" Local customizations / overriding
" Source: https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/
"-------------------------------------------------------------------------------
if filereadable($XDG_CONFIG_HOME . '/nvim/local_init.vim')
    source $XDG_CONFIG_HOME/nvim/local_init.vim
endif


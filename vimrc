" APPEARANCE -----------------------------------------------------------------

" from https://github.com/Erichain/vim-monokai-pro
colorscheme monokai_pro " color scheme
if $COLORTERM == 'gnome-terminal' " Enable 256 colors palette in Gnome Terminal
    set t_Co=256
endif

set number " add numbers to each line on the left side
set nuw=4 " width of line number column
set foldcolumn=0 " add margin to left
set cursorline " highlight cursor line underneath the cursor horizontally
set splitbelow " open new vertical split bottom
set splitright " open new horizontal splits right
set showmode " show what mode we are currently in
set cmdheight=1 " this is about how big that command line at the bottom is allowed to be
set scrolloff=15 " Minimal number of screen lines to keep above and below the cursor
set breakindent " Enable break indent
set linebreak " dont break in the middle of words
set wildmenu wildoptions=pum " little popup menu thing
" set showmatch " Show matching brackets when text indicator is over them

" TAB BEHAVIOUR
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4 " insert 4 spaces on a tab
set expandtab " tabs are spaces, mainly because of Python

" SEARCHING
set incsearch " search as characters are entered
set ignorecase " ignore case in searches by default
set smartcase " but make it case sensitive if an uppercase is entered
set hlsearch " highlight words as they are searched

" HISTORY STUFF ---------------------------------------------------------------
set history=500 " how much history to remember
set undofile " save undo history

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" Enable filetype plugins
syntax enable " syntax highlighting
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime

" ADD THE MATCHING BRACES WHEN TYPING
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
" inoremap ' ''<Esc>ha " this is annoying because i need apostrophes"
inoremap ` ``<Esc>ha

" PLUGINS THAT NEED TO WORK SOMEHOW -------------------------------------------
" let mapleader=<CR> " leader key
" vim.cmd([[autocmd BufNewFile,BufRead *.h set filetype=c]])
" set inccommand=" split" " Preview substitutions live, as you type!
" map , ':FloatermToggle<CR>' "Floaterm toggle

" KEYMAPS ---------------------------------------------------------------------

" navigate buffers
nmap <C-h> :bprev<CR>
nmap <C-l> :bnext<CR>
set switchbuf=useopen,usetab,newtab "behaviour when changing buffer"
set stal=0 " show the other tabs at the top"

"split window to the right
nmap <C-S-Left> :vsplit<CR>
nmap <C-S-Right> :vsplit<CR>
nmap <C-S-Down> :split<CR>
nmap <C-S-Up> :split<CR>

" allow W/Q to be w/q because I make that typo a lot
nmap :W :w
nmap :Q :q
nmap :WQ :wq

" VISUAL MODE
vmap < <gv
vmap > >gv

" PLUGINS --------------------------------------------------------------------

" List plugins to install

call plug#begin()

Plug 'tpope/vim-commentary' " comment highlighting
Plug 'jpalardy/vim-slime' " REPL
Plug 'JuliaEditorSupport/julia-vim' " julia language
Plug 'luochen1990/rainbow' " bracket matching
Plug 'voldikss/vim-floaterm' " make a floating terminal
Plug 'prabirshrestha/vim-lsp' " LSP for vim
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'stevearc/conform.nvim' 
Plug 'kaarmu/typst.vim' 
Plug 'osyo-manga/vim-over'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf.vim'

call plug#end()

" PLUGIN CONFIGURATION

" slime

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
let g:slime_preserve_curpos = 0
let g:slime_dont_ask_default = 1
let g:slime_python_ipython = 1
let g:slime_bracketed_paste = 1

" rainbow
let g:rainbow_active = 1 " rainbow brackets

" lsp stuff
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" COLOR THEME ---------------------------------------------------------------

" color scheme from https://github.com/Erichain/vim-monokai-pro
colorscheme monokai_pro " 

if $COLORTERM == 'gnome-terminal' " Enable 256 colors palette in Gnome Terminal
    set t_Co=256
endif

" APPEARANCE -----------------------------------------------------------------

set number " add numbers to each line on the left side
set nuw=4 " width of line number column
set foldcolumn=0 " add margin to left
set cursorline " highlight cursor line underneath the cursor horizontally
set splitbelow " open new vertical split bottom
set splitright " open new horizontal splits right
set cmdheight=1 " this is about how big that command line at the bottom is allowed to be
set scrolloff=15 " Minimal number of screen lines to keep above and below the cursor
set breakindent " Enable break indent
set linebreak " dont break in the middle of words
set wildmenu wildoptions=pum " little popup menu thing
" set showmatch " Show matching brackets when text indicator is over them made
    " redundant by the rainbow brackets plugin
set laststatus=2
" set showmode " show what mode we are currently in
set noshowmode " hide the current mode in the command line because we use plugin"
set showcmd " see characters as they are typed

" TIME BETWEEN UPDATES FOR E.G. THE GITSIGNS
set updatetime=100 "waits 100 ms before checking things"

" TAB BEHAVIOUR --------------------------------------------------------------
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4 " insert 4 spaces on a tab
set expandtab " tabs are spaces, mainly because of Python

" SEARCHING ------------------------------------------------------------------
set incsearch " search as characters are entered
set ignorecase " ignore case in searches by default
set smartcase " but make it case sensitive if an uppercase is entered
set hlsearch " highlight words as they are searched

" HISTORY STUFF ---------------------------------------------------------------
set history=500 " how much history to remember

" Turn backup off because i hate having a million files and if i make a
" huge mistake and also save and quit then that's just on me it's time for me
" to wear my big boy pants
set nobackup
set nowb
set noswapfile
set noundofile
set hidden

" ENABLE FILETYPE PLUGINS ----------------------------------------------------
syntax enable " syntax highlighting
filetype plugin on
filetype indent on
runtime! ftplugin/man.vim " obviously only for c pages and run :Man whatever in vim to see

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime

" ADD THE MATCHING BRACES WHEN TYPING ----------------------------------------
" ino=insert mode. actuall it is :im for insert mode MAP and then they just
" seemed to go up alphabetically so the next was :in?
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
" inoremap ' ''<Esc>ha " this is annoying because i need apostrophes
inoremap ` ``<Esc>ha

" DON'T ADD THE BRACKET IF WE'RE ON TOP OF ONE ALREADY, INSTEAD MOVE RIGHT
" from here: https://vi.stackexchange.com/a/15601
inoremap <expr> } getline('.')[getpos('.')[2] - 1] == '}' ? '<Right>' : '}'
inoremap <expr> ) getline('.')[getpos('.')[2] - 1] == ')' ? '<Right>' : ')'
inoremap <expr> ] getline('.')[getpos('.')[2] - 1] == ']' ? '<Right>' : ']'
inoremap <expr> " getline('.')[getpos('.')[2] - 1] == '"' ? '<Right>' : '"'
inoremap <expr> ` getline('.')[getpos('.')[2] - 1] == '`' ? '<Right>' : '`'

" PLUGINS THAT NEED TO WORK SOMEHOW -------------------------------------------
" vim.cmd([[autocmd BufNewFile,BufRead *.h set filetype=c]])
" map , ':FloatermToggle<CR>' "Floaterm toggle

" KEYMAPS ---------------------------------------------------------------------

" navigate buffers
nmap <C-h> :bprev<CR>
nmap <C-l> :bnext<CR>
set switchbuf=useopen,usetab,newtab "behaviour when changing buffer"
set stal=0 " show the other tabs at the top"

" split window to the right
nmap <C-S-Left> :vsplit<CR>
nmap <C-S-Right> :vsplit<CR>
nmap <C-S-Down> :split<CR>
nmap <C-S-Up> :split<CR>

" allow W/Q to be w/q because I make that typo a lot
nmap :W :w
nmap :Q :q
nmap :WQ :wq

" allow for mass indenting while in visual mode
vmap < <gv
vmap > >gv

" FORMATTING -----------------------------------------------------------------

" C
augroup CFormat
    autocmd!
    autocmd BufWritePost *.c,*.h silent !clang-format <afile> --i
    autocmd BufWritePost *.c,*.h silent! edit!
augroup END

" R
augroup RFormat
    autocmd!
    autocmd BufWritePost *.r silent !air format <afile> 
    autocmd BufWritePost *.r silent! edit!
augroup END

" python
augroup PythonFormat
    autocmd!
    autocmd BufWritePost *.py silent !black <afile> --quiet
    autocmd BufWritePost *.py silent! edit!
augroup END

" julia
augroup JuliaRunicFormat
    autocmd!
    autocmd BufWritePost *.jl silent !runic --inplace <afile>
    autocmd BufWritePost *.jl silent! edit!
augroup END

" PLUGINS --------------------------------------------------------------------

" List plugins to install

call plug#begin()

Plug 'tpope/vim-commentary' " comment highlighting
Plug 'jpalardy/vim-slime' " REPL
Plug 'JuliaEditorSupport/julia-vim' " julia language
Plug 'luochen1990/rainbow' " bracket matching
Plug 'voldikss/vim-floaterm' " make a floating terminal
Plug 'prabirshrestha/vim-lsp' " LSP for vim
Plug 'mattn/vim-lsp-settings' " more LSP stuff 
Plug 'prabirshrestha/asyncomplete.vim' " more LSP stuff
Plug 'prabirshrestha/asyncomplete-lsp.vim' " more LSP stuff
Plug 'kaarmu/typst.vim' " Typst previews and rendering 
Plug 'osyo-manga/vim-over' " substiution previews 
Plug 'tpope/vim-fugitive' " git stuff
Plug 'airblade/vim-gitgutter' " git diff in gutter on lhs
Plug 'junegunn/fzf.vim' " fuzzy finding 
Plug 'itchyny/lightline.vim' " status line at the bottom
Plug 'sakshamgupta05/vim-todo-highlight'

call plug#end()

" PLUGIN CONFIGURATION -------------------------------------------------------

" floaterm
nmap <C-f> :FloatermToggle<CR>

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

" status bar
function! MyHour() " function defining how time is printed
    return strftime("%H:%M")
endfunction

" function defining what we want in the status bar
let g:lightline = { 
    \ 'active': {
    \     'left': [ 
    \         [ 'mode', 'paste' ],
    \         [ 'gitbranch', 'readonly', 'filename', 'modified' ] 
    \     ],
    \     'right': [ 
    \         [ 'hour' ],
    \         [ 'lineinfo' ],
    \         [ 'percent' ],
    \         [ 'filetype' ], 
    \     ]
    \ },
    \ 'component_function': {
    \     'hour': 'MyHour',
    \     'gitbranch': 'FugitiveHead'
    \ },
    \}

" git gutter
set signcolumn=yes " always have gutter there
let g:gitgutter_set_sign_backgrounds = 1

" TODO: comments
" let g:todo_highlight_config = {
"       \   'REVIEW': {},
"       \   'NOTE': {
"       \     'gui_fg_color': '#ffffff',
"       \     'gui_bg_color': '#ffbd2a',
"       \     'cterm_fg_color': 'white',
"       \     'cterm_bg_color': '214'
"       \   }
"       \ }


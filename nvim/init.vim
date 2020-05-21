" symlink this file to ~/.config/nvim/
" ln --symbolic TARGET DIRECTORY
set nocompatible " get rid of Vi compatibility mode

let g:python3_host_prog = '/opt/anaconda3/bin/python'

" specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'neomake/neomake'
Plug 'morhetz/gruvbox'
Plug 'shougo/deoplete.nvim'

" initialize plugin system
call plug#end()

" Section: General options 
"
" BASIS SETUP:
filetype plugin indent on " filetype detection on, plugin on, indent on
syntax enable " enable syntax highlighting

" FINDING FILES:
"
" search down to into subfolders
" provides tab-completion for all file-related tasks
set path+=**

" display all matching files when we tab complete
set wildmenu
set wildmode=longest:full
" Note:
" - :b lets you autocomplete any open buffer
"
" TAG JUMPING:
"
" create the 'tags' file (may need to install ctags first)
command! MakeTags !ctags -R .
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump up the tag stack
"
" FILE BROWSINGS:
"
" tweaks for browsing
let g:netrw_banner=0 " disable annoying banner
"let g:netrw_browse_split=1 " open in a new horizontal split
"let g:netrw_browse_split=2 " open in a new vertical split
"let g:netrw_browse_split=3 " open in a new tab
let g:netrw_browse_split=4 " open in a previous window
let g:netrw_altv=1 " open splits to the right
let g:netrw_liststyle=3 " tree view
let g:netrw_winsize=25 " tree view width 25% of the page

" Note:
" - :edit or :E to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browser-maps| for more mappings
"
" MAPPING:
"
let mapleader = "," " map leader key from \ to ,
let maplocalleader = "," " map local leader key from \ to ,

" Use `ALT+{h, j, k, l}` to navigate windows from any mode
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
inoremap <A-h> <C-\><C-n><C-w>h
inoremap <A-j> <C-\><C-n><C-w>j
inoremap <A-k> <C-\><C-n><C-w>k
inoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Map <Esc> to exit terminal-mode
tnoremap <Esc> <C-\><C-n>

" use F6 to check spell (German)
map <F6> :setlocal spell! spelllang=de<CR>

" DISPLAY:
"
colorscheme gruvbox
set background=dark

set number " show line numbers
set printoptions=number:y " print with line number
set relativenumber " show relative number with current line
set showcmd
set ruler
set showmatch " Show matching brackets
set list " Shows eol and another characters
set listchars=tab:>\ ,trail:-,extends:>,precedes:< " define the list chars
set cmdheight=2 " two lines of command

" GENERAL:
"
set autoread " autoread file

" SEARCH:
"
set hlsearch " continue Highlight searched phreases
"set nohlsearch " don't continue to Highlight searched phrases
set incsearch " do Highlight as you tupe your search
set ignorecase " make searches case-insensitive
"set smartcase " Ignore case when searching

" COMPLETION:
" Popup menu even only one match and do not insert any text of a match
set completeopt=menuone,longest

" ENCODING:
"
set encoding=utf8 " use UTF-8 encoding
set ffs=unix,dos " use Unix as the standard file type
"set ffs=dos " use dos as the standard file type

" TEXTFORMAT:
"
set expandtab " use spaces instead of tabs
set smarttab " use tabs at the start of line, spaces elsewhere
set autoindent " auto indent
set smartindent " smart indent
set softtabstop=4 " unify
set shiftwidth=4 " indent/outdent by 4 columns
set shiftround " always indent/outdent to the nearest tabstop
set tabstop=4 " tab spacing

" Enable folding
set foldmethod=marker

set nowrap " don't wrap text

" Section: Plugin settings 
"
" Vim-Easy-Algin:
"" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"
" Shougo Deoplete:
"
let g:deoplete#enable_at_startup = 1

" Don't use file path in buffer but in working directory instead
call deoplete#custom#var('file', 'enable_buffer_path', v:false)
" Use smartcase.
"call deoplete#custom#var('smart_case', v:true)
" Sources of completion
call deoplete#custom#var('sources', {
\ '_': ['buffer', 'tag', 'file'],
\})

" davidhalter Jedi-Vim:
let g:jedi#completions_enabled = 0 " using deoplete-jedi instead
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#show_call_signatures = "2"
let g:jedi#show_call_signatures_delay = 0
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
"
" deoplete-jedi:
let g:deoplete#sources#jedi#enable_typeinfo=0 " quicker if don't show typeinfo
let g:deoplete#sources#jedi#show_docstring=0 " show docstring in preview
let g:deoplete#sources#jedi#python_path='c:\users\minh\Anaconda3\python.exe'
"
" Neomake:
call neomake#configure#automake('nrw', 50)
let g:neomake_python_enabled_makers = ['pylint']
let g:neomake_python_pylint_maker = {
    \ 'exe': 'c:\users\minh\anaconda3\Scripts\pylint.exe'
    \}

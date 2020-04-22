"  ██████                           ██ ██   ██   ██      ██ ██    ██
" ░█░░░░██                         ░██░░   ░██  ░██     ░██░░    ░░
" ░█   ░██   ██████   ███████      ░██ ██ ██████░██     ░██ ██    ██  ██████
" ░██████   ░░░░░░██ ░░██░░░██  ██████░██░░░██░ ░██████████░██   ░██ ██░░░░██
" ░█░░░░ ██  ███████  ░██  ░██ ██░░░██░██  ░██  ░██░░░░░░██░██   ░██░██   ░██
" ░█    ░██ ██░░░░██  ░██  ░██░██  ░██░██  ░██  ░██     ░██░██ ██░██░██   ░██
" ░███████ ░░████████ ███  ░██░░██████░██  ░░██ ░██     ░██░██░░███ ░░██████
" ░░░░░░░   ░░░░░░░░ ░░░   ░░  ░░░░░░ ░░    ░░  ░░      ░░ ░░  ░░░   ░░░░░░
"
"           ██
"          ░░
"  ██    ██ ██ ██████████  ██████  █████
" ░██   ░██░██░░██░░██░░██░░██░░█ ██░░░██
" ░░██ ░██ ░██ ░██ ░██ ░██ ░██ ░ ░██  ░░
"  ░░████  ░██ ░██ ░██ ░██ ░██   ░██   ██
"   ░░██   ░██ ███ ░██ ░██░███   ░░█████
"    ░░    ░░ ░░░  ░░  ░░ ░░░     ░░░░░


" ----------------------------------------------------------------------------
" BanditHijo's .vimrc
" dotfiles : https://github.com/bandithijo/dotfiles
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
set nocompatible               " be iMproved, required
set t_Co=256                   " set terminal 256 color
"filetype off                   " required
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" Plugin Manager {{{
" Plugin Manager : vim-plug
" Source : https://github.com/junegunn/vim-plug

call plug#begin('~/.vim/plugged')

" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'

" A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'

" A lightweight plugin to display the list of buffers in the lightline vim plugin
Plug 'mengelbrecht/lightline-bufferline'

" A lean & mean status/tabline for vim that's light as air
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'airblade/vim-gitgutter'

" fugitive.vim: A Git wrapper so awesome, it should be illegal.
Plug 'tpope/vim-fugitive'

" A command-line fuzzy finder.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Better whitespace highlighting for Vim.
Plug 'ntpeters/vim-better-whitespace'

" emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet.
Plug 'mattn/emmet-vim'

" Vastly improved Javascript indentation and syntax support in Vim.
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'jparise/vim-graphql'

" rsi.vim: Readline style insertion (saya pakai untuk alt+delete: menghapus 1 kata).
Plug 'tpope/vim-rsi'

" ragtag.vim: ghetto HTML/XML mappings (formerly allml.vim)*
Plug 'tpope/vim-ragtag'

" Vim plugin that displays tags in a window, ordered by scope. with F8
Plug 'majutsushi/tagbar'

" A commentary.vim: comment stuff out
Plug 'tpope/vim-commentary'

" Vim plugin which provides sgml (xml, html, etc.) end tag completion. autoclose tag </
Plug 'ervandew/sgmlendtag'

" Make terminal vim and tmux work better together.
Plug 'tmux-plugins/vim-tmux-focus-events'

" Syntax highlighting, matching rules and mappings for the original Markdown and extensions.
Plug 'plasticboy/vim-markdown'

" A markdown preview plugin for (neo)vim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, Powerline, Unite, vim-startify and more.
Plug 'ryanoasis/vim-devicons'

" Vim Liquid runtime files with Jekyll enhancements.
Plug 'tpope/vim-liquid'

" Install nightly build, replace ./install.sh with install.cmd on windows
"Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
" Or install latest release tag
Plug 'neoclide/coc.nvim', {'do': './install.sh'}
" Or build from source code
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" rails.vim: Ruby on Rails power tools
Plug 'tpope/vim-rails'

" Vim/Ruby Configuration Files
Plug 'vim-ruby/vim-ruby'

" Highlight eruby code blocks within html.
Plug 'vim-scripts/eruby.vim'

" bundler.vim: Lightweight support for Ruby's Bundler
Plug 'tpope/vim-bundler'

" A vim plugin to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" A Typescript syntax files for Vim
"Plug 'leafgarland/typescript-vim'

" A JSX syntax pretty highlighting for vim.
"Plug 'maxmellon/vim-jsx-pretty'

" A Vim runtime files for Haml, Sass, and SCSS
Plug 'tpope/vim-haml'

" A one colorscheme pack to rule them all!
Plug 'flazz/vim-colorschemes'

" Simple tmux statusline generator with support for powerline symbols and
" statusline / airline / lightline integration
"Plug 'edkolev/tmuxline.vim'

" A plugin for automatically restoring file's cursor position and folding
Plug 'vim-scripts/restore_view.vim'

" Text outlining and task management for Vim based on Emacs' Org-Mode
Plug 'jceb/vim-orgmode'

" (vim-orgmode need this) {{{
" Speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'vim-scripts/Vimball'

Plug 'tpope/vim-speeddating'

Plug 'chrisbra/NrrwRgn'

" Univeral Text Linking - Execute URLs, footnotes, open emails, organize ideas
Plug 'vim-scripts/utl.vim'

" Vim Table Mode for instant table creation.
Plug 'dhruvasagar/vim-table-mode'
" (vim-orgmode need this) }}}

" A open source plugins for automatic programming metrics
Plug 'wakatime/vim-wakatime'

" A vim plugin for alternative search programs like ack or csearch.
Plug 'idbrii/vim-notgrep'

" A True Sublime Text style multiple selections for Vim
"Plug 'terryma/vim-multiple-cursors'

" A Vim highlighting & completion for MiniTest
Plug 'sunaku/vim-ruby-minitest'

" A modern vim plugin for editing LaTeX files
Plug 'lervag/vimtex'


call plug#end()
" }}}
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" Basic {{{
" ----------------------------------------------------------------------------
syntax enable
filetype plugin indent on
set encoding=UTF-8
" }}}
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" General {{{
" ----------------------------------------------------------------------------
set backspace=indent,eol,start " make backspace a more flexible
set backup " make backup files
set backupdir=~/.vim/tmp/backup " where to put backup files
set directory=~/.vim/tmp/swap " directory to place swap files in
set undodir=~/.vim/tmp/undo " directory to place undo files in
set undofile " make undo possible after the file is closed and reopened
set clipboard=unnamedplus " share clipboard (unnamedplus)
set hidden " you can change buffers without saving
set mouse=n " use mouse everywhere default a
set noerrorbells " don't make noise
set wildmenu " turn on command line completion wild style
set wildmode=full
set ttyfast " i have a fast terminal
set gdefault " global substitutions are default s/a/b/g
set ttimeoutlen=0  " make Esc work faster
set autoread " make vim monitor realtime changes to a file
set modifiable
"set cryptmethod=blowfish2  " only for Vim, not Neovim
"au CursorHold,CursorHoldI * checktime " auto update trigger when cursor stops moving
"au FocusGained,BufEnter * :checktime  " auto update trigger on buffer change or terminal focus
" for italic on tmux
set t_ZH=[3m
set t_ZR=[23m
" }}}
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" VIM User Interface {{{
" ----------------------------------------------------------------------------
let g:vim_monokai_tasty_italic = 0
colorscheme Tomorrow-Night-Bandit
set background=dark
set incsearch " incremental search aka search as you type
set hlsearch " highlight search matches
set ignorecase " ignore case
set smartcase " but when the query starts with upper character be case sensitive
set laststatus=2 " always show the status line, vim 1, neovim 2
set lazyredraw " do not redraw while running macros
set linespace=0 " don't insert any extra pixel lines between rows
"set nolist " no show traling listchars
"set listchars=tab:▸\ ,eol:$,trail:¬,extends:❯,precedes:❮,nbsp:~
set list " no show traling listchars
set listchars=tab:  ,trail:·,extends:>,precedes:<
set nostartofline " don't move the cursor to first non-blank character after some command    s (:25 e.g.)
set novisualbell " don't blink
set nu " turn on line number on selected line
set relativenumber " turn on line numbers
"au TerminalOpen * setlocal listchars= nonumber norelativenumber
set report=0 " tell us when anything is changed
set ruler " always show current positions along the bottom
set foldmethod=manual
set foldlevel=0 " default unfold when open a file
set shortmess=aAtToO " shortens messages to avoid 'press a key' prompt
set showcmd " show the command being typed
set showmode " show current mode
set showmatch " show matching brackets
"set scrolloff=5 " keep 10 lines (top/bottom) for scope
"set sidescrolloff=10 " keep 5 lines at the size
set cursorline " visually mark current line
"set showbreak=↪ " indicate wrapped line
hi clear ModeMsg " disable Color StatusLine on Insert Mode and Visual Mode
hi HighlightedyankRegion term=bold ctermfg=0 ctermbg=3
if &diff " change colorscheme when using vimdiff
  colorscheme Tomorrow-Night-Bandit
endif
" }}}
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" Text Formatting/Layout {{{
" ----------------------------------------------------------------------------
set wrap " wrap text
"set textwidth=80 " to 80 characters
set colorcolumn=80 " and warn me if my line gets over 85 characters
set formatoptions=cqt " see :help fo-table
set infercase " case inferred by default
set shiftround " round the indent to shiftwidth (when at 3 spaces, and I hit > go to 4, n    ot 5)
set expandtab " no real tabs please!
set shiftwidth=4 " auto-indent amount when using >> <<
set softtabstop=4 " when hitting tab or backspace, how many spaces should a tab be (see e    xpandtab)
set tabstop=4 " real tabs should be 4, and they will show with set list on
set autoindent
"set smartindent
set conceallevel=0
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " Highlight VCS conflict markers"
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 ft=jinja
autocmd FileType html.django setlocal shiftwidth=2 tabstop=2 ft=jinja
autocmd FileType jinja.html setlocal shiftwidth=2 tabstop=2 ft=jinja
autocmd FileType jinja setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType org setlocal shiftwidth=2 tabstop=2 foldmethod=expr nowrap
autocmd FileType python setlocal shiftwidth=4 tabstop=4 wrap textwidth=79 formatoptions+=t
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 conceallevel=0
autocmd FileType liquid setlocal shiftwidth=2 tabstop=2 conceallevel=0
autocmd FileType vim setlocal shiftwidth=2 tabstop=2 conceallevel=0
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 conceallevel=0
autocmd FileType tex setlocal shiftwidth=2 tabstop=2 conceallevel=0
au BufRead,BufNewFile *.tex setlocal ft=tex
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright
" }}}
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" Keyboard Mappings {{{
" ----------------------------------------------------------------------------
" my leader key is comma
let mapleader = ","
let maplocalleader = ','

" for edit my .vimrc
nmap <leader>ev :e ~/.vimrc<cr>

" for edit load my ssg blog writing guide (petunjuk penulisan)
nmap <leader>ed :e ~/dex/bandithijo.com/_drafts/2018-01-01-format-penulisan-post.md<cr>

" for edit utl.vim
nmap <leader>eu :e ~/.vim/plugged/utl.vim/plugin/utl_rc.vim<cr>

" for edit utl.vim
nmap <leader>eo :e ~/.vim/plugged/vim-orgmode/doc/orgguide.txt<cr>

" source vimrc
nmap <leader>es :so $MYVIMRC

" for move & delete buffer
nmap <leader>n :bn<cr>
nmap <leader>p :bp<cr>
nnoremap <leader>d :bp<cr>:bd! #<cr>

" this key combination gets rid of the search highlights
nmap <leader><space> :noh<cr>

" for clear highlight search
nmap <leader><space> :nohlsearch<cr>

" Ctags
nmap <leader>g <C-]>

" strip all trailing whitespace in the current file
nmap <leader>W :StripWhitespace<cr>

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" open vertical split and switch to it
"nnoremap <leader>v <C-w>v<C-w>l

" open horizontal split and switch to it
"nnoremap <leader>s <C-w>s<C-w>l

" Map Ctrl-Backspace to delete the previous word in insert mode.
imap <C-BS> <C-W>

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>C :w! \| !compiler <c-r>%<CR>

" Remap exit from terminal mode
tnoremap <Esc> <C-\><C-n>

" for search
nnoremap / /\v
vnoremap / /\v

" keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" another way to esc mode
imap jj <Esc>

" I hit F1 too often when reaching esc button
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" toggle NerdTree plugin
nmap <F12> :NERDTreeToggle<cr>

" toggle vim-minimap
"let g:minimap_toggle='<F10>'

" for move focus to each split
nmap <C-h> <C-w><C-h>
nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <C-l> <C-w><C-l>

" sudo save
cmap w!! w !sudo tee % >/dev/null

" quit all
cmap Q qa

" for page up & page down
noremap <C-u> <C-u>zz
noremap <C-d> <C-d>zz

" toggle Tagbar plugin
nmap <F11> :TagbarToggle<cr>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" toggle PymodeLintToggle
nmap <F9> :PymodeLintToggle<cr>

" fzf.vim
nmap <C-p> :Buffers<cr>
nmap <C-f> :FZF<cr>
"nmap <C-f> :Files<cr>

" disable arrow keys on insert mode and make up & down arrow as line bubbling
"no <down> ddp
"nmap <down> ]e " handled by vim-unimpaired
" no <down> <Nop>
" no <left> <Nop>
" no <right> <Nop>
" no <up> <Nop>
"no <up> ddkP
"nmap <up> [e " handled by vim-unimpaired
" ino <down> <Nop>
" ino <left> <Nop>
" ino <right> <Nop>
" ino <up> <Nop>
" vno <down> <Nop>
" vno <left> <Nop>
" vno <right> <Nop>
" vno <up> <Nop>

" prevent Vim scrolling when splitting a window
nnoremap <C-W>s Hmx`` \|:split<CR>`xzt``
" ----------------------------------------------------------------------------
" }}}
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" Plugins Settings {{{
" ----------------------------------------------------------------------------

" NerdTree {{{
" ----------------------------------------------------------------------------
let NERDTreeHijackNetrw = 0
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
"let g:NERDTreeDirArrowExpandable = ' '
"let g:NERDTreeDirArrowCollapsible = ' '
"let g:NERDTreeDirArrowExpandable = '+'
"let g:NERDTreeDirArrowCollapsible = '-'

" Disable arrow icons at the left side of folders for NERDTree.
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"

" Width
let g:NERDTreeWinSize=35

" SignColumn
autocmd FileType nerdtree setlocal signcolumn=no

" Disable NERDTree close when buffer delete
"autocmd FileType nerdtree cnoreabbrev <buffer> bd <nop>

" Open NERDTree when no files to open
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree when open a directory
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTree' argv()[0] | endif
" ----------------------------------------------------------------------------
" }}}

" TagBar {{{
" ----------------------------------------------------------------------------
let g:tagbar_width = 35
let g:airline#extensions#tagbar#enabled = 0
" ----------------------------------------------------------------------------
" }}}

" Vim-DevIcons {{{
" ----------------------------------------------------------------------------
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
highlight! link NERDTreeFlags NERDTreeDir

" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" change the default folder/directory glyph/icon
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
" change the default open folder/directory glyph/icon (default is '')
let g:DevIconsDefaultFolderOpenSymbol = ''
" ----------------------------------------------------------------------------
" }}}

" emmet-vim trigger key remap {{{
" ----------------------------------------------------------------------------
" Default leader key is <c-y>,
"let g:user_emmet_leader_key='<C-space>' " then press , (comma) to do magic !
let g:user_emmet_mode='a'                "enable all function in all mode
" ----------------------------------------------------------------------------
" }}}

" Vim-Airline {{{
" ----------------------------------------------------------------------------
let g:airline_powerline_fonts = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" Here is a complete list of formatters with screenshots:
" default, jsformatter, unique_tail, unique_tail_improved

" enable/disable fugitive/lawrencium integration
let g:airline#extensions#branch#enabled = 1

" enable/disable showing a summary of changed hunks under source control.
let g:airline#extensions#hunks#enabled = 1

" enable/disable showing only non-zero hunks.
let g:airline#extensions#hunks#non_zero_only = 1

let g:airline#extensions#whitespace#enabled = 0

let g:airline#extensions#tmuxline#enabled = 0

" Vim-Airline-Theme
let g:airline_theme='minimalist_bandit'

" Patching for middle section status line Terminal color
let s:saved_theme = []
let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
  for colors in values(a:palette)
    if has_key(colors, 'airline_c') && len(s:saved_theme) ==# 0
      let s:saved_theme = colors.airline_c
    endif
    if has_key(colors, 'airline_term')
      let colors.airline_term = s:saved_theme
    endif
  endfor
endfunction
" ----------------------------------------------------------------------------
" }}}

" LightLine {{{
" ----------------------------------------------------------------------------
let g:lightline = {
\   'colorscheme': 'freebsd',
\   'active': {
\    'left' :[[ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly' ],
\             [ 'filename', 'modified' ]],
\    'right':[[ 'lineinfo' ],
\             [ 'percent' ],
\             [ 'filetype', 'fileencoding', 'fileformat' ] ]
\   },
\   'component': {
\     'lineinfo': ' %3l:%-2v',
\     'filename': '%<%f'
\   },
\   'component_function': {
\     'gitbranch': 'LightlineFugitive',
\     'readonly': 'LightlineReadonly',
\     'modified': 'LightlineModified',
\     'fileformat': 'LightlineFileformat',
\     'filetype': 'LightlineFiletype',
\   }
\}
"  'left': '', 'right': ''
let g:lightline.separator = {
\   'left': '', 'right': ''
\}
"   'left': '', 'right': ''
let g:lightline.subseparator = {
\   'left': '│', 'right': '│'
\}
let g:lightline.tabline = {
\   'left': [['buffers']],
\   'right': [['string1'], ['string2']]
\}
let g:lightline.component_expand = {
\   'buffers': 'lightline#bufferline#buffers'
\}
let g:lightline.component_type = {
\   'buffers': 'tabsel'
\}

function! LightlineModified()
  return &modified ? '●' : ''
endfunction

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return fugitive#head()
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

" autoreload
command! LightlineReload call LightlineReload()

function! LightlineReload()
 call lightline#init()
 call lightline#colorscheme()
 call lightline#update()
endfunction

set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
" ----------------------------------------------------------------------------
" }}}

" LightLine-BufferLine {{{
" ----------------------------------------------------------------------------
let g:lightline#bufferline#unnamed = "[NO NAME]"
let g:lightline#bufferline#filename_modifier= ":."
let g:lightline#bufferline#more_buffers = "..."
let g:lightline#bufferline#modified = " ●"
let g:lightline#bufferline#read_only = " "
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1
" ----------------------------------------------------------------------------
" }}}

" Rubycomplete {{{
" ----------------------------------------------------------------------------
let g:rubycomplete_rails=1
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_include_object=1
let g:rubycomplete_include_objectspace=1
" ----------------------------------------------------------------------------
" }}}

" Greplace {{{
" ----------------------------------------------------------------------------
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'
" ----------------------------------------------------------------------------
" }}}

" pylint {{{
" ----------------------------------------------------------------------------
let g:syntastic_python_checkers = ['pylint']  "" or ['flake8', 'pylint'], etc
let g:syntastic_python_pylint_args = '-E'
"" to show it accepts a string of args, also:
" let g:syntastic_python_pylint_args = '--rcfile=/path/to/rc -E'
" ----------------------------------------------------------------------------
" }}}

" markdown-preview {{{
" ----------------------------------------------------------------------------
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
" ----------------------------------------------------------------------------
" }}}

" FZF {{{
" ----------------------------------------------------------------------------
" Default fzf layout
" - down / up / left / right
"let g:fzf_layout = { 'down': '~50%' }
" Required:
" - width [float]
" - height [float]
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" Optional:
" - highlight [string default 'Comment']: Highlight group for border
" - rounded [boolean default v:true]: Use rounded border
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8, 'highlight': 'Normal', 'rounded': v:false } }

" In Neovim, you can set up fzf window using a Vim command
"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window': '-tabnew' }
"let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
\   'bg':      ['bg', 'Normal'],
\   'hl':      ['fg', 'Comment'],
\   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\   'hl+':     ['fg', 'Statement'],
\   'info':    ['fg', 'PreProc'],
\   'border':  ['fg', 'Ignore'],
\   'prompt':  ['fg', 'Conditional'],
\   'pointer': ['fg', 'Exception'],
\   'marker':  ['fg', 'Keyword'],
\   'spinner': ['fg', 'Label'],
\   'header':  ['fg', 'Comment'] }

" let g:fzf_colors =
" \ { 'fg':         ['fg', 'Normal'],
" \   'bg':         ['bg', 'Normal'],
" \   'preview-fg': ['bg', 'Normal'],
" \   'preview-bg': ['bg', 'Normal'],
" \   'hl':         ['fg', 'Search'],
" \   'fg+':        ['bg', 'Search'],
" \   'bg+':        ['fg', 'Search'],
" \   'hl+':        ['bg', 'CursorLine'],
" \   'info':       ['fg', 'Search'],
" \   'border':     ['fg', 'Normal'],
" \   'prompt':     ['fg', 'Search'],
" \   'pointer':    ['fg', 'Search'],
" \   'marker':     ['fg', 'Search'],
" \   'spinner':    ['fg', 'Search'],
" \   'header':     ['fg', 'Search'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
"let g:fzf_history_dir = '~/.local/share/fzf-history'

" Custom statusline
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=0 ctermbg=15
  highlight fzf2 ctermfg=0 ctermbg=15
  highlight fzf3 ctermfg=0 ctermbg=15
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" preview
"let  $FZF_DEFAULT_OPTS='--reverse --margin=1,1 --preview-window=right:50% --preview="bat --style=plain --color=never {}"'
"let  $FZF_DEFAULT_OPTS='--margin=1,1 --preview-window=right:50% --preview="less {}"'
" ----------------------------------------------------------------------------
" }}}

" Python-Mode {{{
" ----------------------------------------------------------------------------
"let g:pymode_python = 'python3'
"let g:pymode_rope = 0
"let g:pymode_rope_lookup_project = 0
"let g:pymode_rope_complete_on_dot = 0
"let g:pymode_rope_autoimport = 0
let g:python_host_prog = '/usr/local/bin/python2.7'
let g:python3_host_prog = '/usr/local/bin/python3.7'
" linter syntax checker : pylint, pycodestyle, pyflakes, pep8, flake8
"let g:pymode_lint_checkers = ['pylint']
" ----------------------------------------------------------------------------
" }}}

" pgsql {{{
" ----------------------------------------------------------------------------
let g:sql_type_default = 'pgsql'
" ----------------------------------------------------------------------------
" }}}

" LanguageTool {{{
" ----------------------------------------------------------------------------
let g:languagetool_jar='/home/bandithijo/app/LanguageTool/LanguageTool-4.6/languagetool-commandline.jar'
" ----------------------------------------------------------------------------
" }}}

" CoC {{{
" ----------------------------------------------------------------------------
" Enable if want to install the extensions
" let g:coc_global_extensions = [
"             \ 'coc-yank', 'coc-vimlsp', 'coc-ultisnips', 'coc-snippets',
"             \ 'coc-lists', 'coc-highlight', 'coc-git', 'coc-emmet',
"             \ 'coc-yaml', 'coc-tsserver', 'coc-svg', 'coc-solargraph',
"             \ 'coc-rls', 'coc-python', 'coc-phpls', 'coc-json', 'coc-java',
"             \ 'coc-html', 'coc-css', 'coc-angular']

let g:coc_force_debug = 1
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" ----------------------------------------------------------------------------
" }}}

" indentLine {{{
" ----------------------------------------------------------------------------
let g:indentLine_color_term = 10
let g:indentLine_char = '┊'
let g:indentLine_fileTypeExclude = [
            \ '', 'markdown', 'json', 'liquid', 'org', 'conf', 'tex']
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_leadingSpaceChar = '·'
" ----------------------------------------------------------------------------
" }}}

" vim-gitgutter {{{
" ----------------------------------------------------------------------------
let g:gitgutter_async = 1
"let g:gitgutter_realtime = 1
"let g:gitgutter_eager = 1
" ----------------------------------------------------------------------------
" }}}

" vim-commentary {{{
" ----------------------------------------------------------------------------
autocmd FileType desktop setlocal commentstring=#\ %s
autocmd FileType vim setlocal commentstring=\"\ %s
" ----------------------------------------------------------------------------
" }}}

" restore_view {{{
" ----------------------------------------------------------------------------
set viewoptions=cursor,folds,slash,unix
" let g:skipview_files = ['*\.vim']

" ----------------------------------------------------------------------------
" }}}

" vim-orgmode {{{
" ----------------------------------------------------------------------------
let g:org_indent = 1
let g:org_aggressive_conceal = 0
let g:org_heading_highlight_colors = ['Title', 'Constant', 'Identifier',
            \   'Statement', 'PreProc', 'Type', 'Special']
let g:org_heading_highlight_levels = len(g:org_heading_highlight_colors)
let g:org_heading_shade_leading_stars = 1

let g:org_todo_keywords = [
            \ ['TODO(t)', 'WAITING(w)', 'DONE(d)'],
            \ ['REPORT(r)', 'BUG(b)', 'KNOWNCAUSE(k)', 'FIXED(f)'],
            \ ['CANCELED(c)']]
let g:org_todo_keyword_faces = [
            \ ['WAITING', [':foreground 3']], ['DONE', [':foreground 2']],
            \ ['REPORT', [':foreground 3']],
            \ ['BUG', [':foreground 3']],
            \ ['KNOWNCAUSE', [':foreground 3']],
            \ ['FIXED', [':foreground 2']],
            \ ['CANCELED', [':foreground red']]]
" ----------------------------------------------------------------------------
" }}}

" vim-table-mode {{{
" ----------------------------------------------------------------------------
" To start using the plugin in the on-the-fly mode use :TableModeToggle
" mapped to <Leader>tm by default (which means \ t m if you didn't override
" the by :let mapleader = ',' to have , t m).

" Corner separators are adjustable:
" For Markdown-compatible tables use
"let g:table_mode_corner='|'
" To get ReST-compatible tables use
"let g:table_mode_corner_corner='+'
"let g:table_mode_header_fillchar='='

" Tip : You can use the following to quickly enable / disable table mode
" in insert mode by using || or __ :
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'
" ----------------------------------------------------------------------------
" }}}

" vimtex {{{
" ----------------------------------------------------------------------------
" Default keybindings: https://github.com/lervag/vimtex/wiki/usage
" https://github.com/lervag/vimtex/wiki/introduction
let g:vimtex_compiler_progname='nvr'

let g:vimtex_latexmk_enabled=1
let g:vimtex_latexmk_continuous=1

let g:vimtex_compiler_latexmk = {
        \ 'executable' : 'latexmk',
        \ 'options' : [
        \   '-xelatex',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}

let g:vimtex_quickfix_mode=2
let g:vimtex_quickfix_open_on_warning=0

let g:vimtex_quickfix_autoclose_after_keystrokes=1

let g:vimtex_quickfix_latexlog = {
      \ 'default'       : 1,
      \ 'general'       : 1,
      \ 'references'    : 1,
      \ 'overfull'      : 1,
      \ 'underfull'     : 1,
      \ 'font'          : 1,
      \ 'packages' : {
      \   'default'     : 1,
      \   'general'     : 1,
      \   'babel'       : 1,
      \   'biblatex'    : 1,
      \   'fixltx2e'    : 1,
      \   'hyperref'    : 1,
      \   'natbib'      : 1,
      \   'scrreprt'    : 1,
      \   'titlesec'    : 1,
      \ },
      \}
" ----------------------------------------------------------------------------
" }}}































" }}}
" ---------------------------------------------------------------------------

" vim: ft=vim fdm=marker

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'w0rp/ale'
Plug 'valloric/youcompleteme', "{ 'do': './install.py --clang-completer' }
Plug 'jiangmiao/auto-pairs'
Plug 'wakatime/vim-wakatime'
Plug 'mhinz/vim-signify'
Plug 'Shougo/echodoc.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'Chiel92/vim-autoformat'
Plug 'vim-python/python-syntax'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'vim-scripts/bufexplorer.zip'

call plug#end()

let mapleader = ','
let g:mapleader = ','

set encoding=utf-8
set history=2000        " set history upper limit

filetype on             " check file type
filetype indent on      " indent for different file
filetype plugin on      " allow plugin

set title               " change terminal's title
set autoread            " auto reload file
set showmatch           " cursor shows matching ) and }
set matchtime=3         " how many tens of second to blink when matching bracket
set ruler               " always show current position
set number              " show line number
set relativenumber      " turn hybrid line number on
                        " toggle it check below
set showcmd             " show command on status bar
set scrolloff=15        " keep 15 lines when scrol down or up
set wrap                " display long lines as multiple line
set breakindent         " enable indentation
" ident by an additional 4 characters on wrapped lines, when line >= 10 characters, put 'showbreak' at start of line
set breakindentopt=shift:4,sbr,min:10
set showbreak=↪       "wrap indent

set autoindent          " auto indentation
set smartindent         " Smart Indent
set copyindent          " copy previous indentation on autoindenting
"set hlsearch           " search highlighting
"set incsearch          " make search acts like in browsers
"set ignorecase         " ignore case when searching
"set smartcase          " case sensitive when more than one capitalize
set smarttab            " insert tabs on the start of line based on context
"set cursorcolumn        " highlight current column
set cursorline          " highlight current line
set mousehide           " hide the mouse when typing
set mouse=a            " not sure what it does, https://gist.github.com/u0d7i/01f78999feff1e2a8361

set tabstop=4           " tab key width
set shiftwidth=4        " indent width
set softtabstop=4       " insert tabs on the start of line based on shiftwidth
set smarttab            " tab to space
set expandtab

set hid                 " A buffer becomes hidden when it is abandoned
set mat=2               " How many tenths of a second to blink when matching brackets

set novisualbell        " disable sound on error
set noerrorbells        " disable sound on error
set t_vb=               " disable sound on error
set tm=500              " ?

set foldenable          " code folding
set foldmethod=indent   " fold depend on indent
set foldlevel=99        " fold level
"set foldcolumn=1        " Add a bit extra margin to the left

" code folding function at functions.vim

set wildmenu                " wild char completion menu
set wildignore=*.o,*~,*.pyc " ignore compiled files
set wildmode=list:longest
set completeopt=longest,menu " auto complete like normal IDE
set magic                   " for regular expressions turn magic on

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" More natural split
set splitright
set splitbelow

" Vim paste copy to OS clipboard
set clipboard+=unnamed

" More natural split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" Easymotion
"
map <Leader>fd <Plug>(easymotion-bd-f)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1

"
" Airline
"
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_section_z = '%P %l/%L%{g:airline_symbols.maxlinenr} : %v'
" Use patched fonts
let g:airline_powerline_fonts = 1
" enable/disable fugitive/lawrencium integration
let g:airline#extensions#branch#enabled = 1
" enable/disable showing a summary of changed hunks under source control.
let g:airline#extensions#hunks#enabled = 1
" enable/disable showing only non-zero hunks.
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tmuxline#enabled = 1
set ttimeoutlen=10
" bufferline
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables=0
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_echo = 0
let g:bufferline_show_bufnr = 1
let g:bufferline_rotate = 1
let g:bufferline_excludes = ['\[vimfiler\]', 'NERD_tree_1']
let g:bufferline_separator = ''
let g:bufferline_inactive_highlight = 'airline_c'
let g:bufferline_active_highlight = 'airline_c'


" Tab navigation
nnoremap <S-tab> :bnext<CR>
nmap <leader>1 :bfirst<CR>
nmap <leader>2 :bfirst<CR>:bn<CR>
nmap <leader>3 :bfirst<CR>:2bn<CR>
nmap <leader>4 :bfirst<CR>:3bn<CR>
" fix ui bug
command! AirlineForceRefresh call airline#load_theme() | call airline#update_statusline() | call airline#load_theme() | call airline#update_statusline()


"
" LeaderF
"
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <m-p> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}


"
" Ale
" https://www.zhihu.com/question/47691414/answer/373700711
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_rust_rls_toolchain = "stable"
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1

let g:ale_fixers = {
    \ 'rust': ['rustfmt'],
    \}
let g:ale_linters = {
    \ 'cpp': ['clang'],
    \ 'python': ['flake8'],
    \ 'rust': ['rls'],
    \}
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'

let g:ale_sign_error = ">>"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)

"
" YouCompleteMe
"
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-space>'
set completeopt=menu,menuone
noremap <c-z> <NOP>
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,rust': ['re!\w{2}'],
            \ }
let g:ycm_server_python_interpreter='/usr/local/bin/python'
let g:syntastic_python_checkers=['pyflakes']
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_rust_src_path = '/Users/hongyilyu/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'
let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "cpp":1,
            \ "zsh":1,
            \ "python":1,
            \ "rust":1,
            \ }

let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <F5>           :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>gt 	:YcmCompleter GoTo<CR>
nnoremap <leader>f      :YcmCompleter FixIt<CR>

"
"
"
let g:rustfmt_command = "rustfmt +nightly"
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'


"
" echodoc
"
set noshowmode
let g:echodoc#enable_at_startup = 1

"
" indentLine
"
" color with color scheme instead of default grey
let g:indentLine_setColors = 0
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
nnoremap <F4>           :IndentLinesToggle<CR>

"
" autoformat
" https://github.com/Chiel92/vim-autoformat
noremap <F3> :Autoformat<CR>
let g:autoformat_verbosemode=1

"
" bufexplorer.zip
"
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>b :BufExplorer<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
colorscheme solarized
set background=dark
let g:solarized_termtrans=1
if has('gui_running')
    set background=light
else
    set background=dark
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle auto relative number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" code folding shortcuts <leader>zz
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" open file at location that was last viewed
if has("autocmd")
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif


" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.rs,*.cpp :call CleanExtraSpaces()
endif


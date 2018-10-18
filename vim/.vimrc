 " vim:fdm=marker

" Detect OS {{{
    let s:is_windows = has('win32') || has('win64')
    let s:is_cygwin = has('win32unix')
    let s:is_macvim = has('gui_macvim')
" }}}

" Startup {{{
    if has('vim_starting')
        set nocompatible        " Be iMproved
        set all&                " Reset everything to default
        set path+=**

        if s:is_windows
            set rtp+=~/.vim
        endif
    endif
" }}}

" Global vars {{{
    let s:cache_dir = '~/.vim/.cache'
    " let g:BufKillCreateMappings = 0
"}}}


call plug#begin('~/.vim/plugged')
" Plugins {{{
    " ----------- Required -----------
        " Vim plugin management
        Plug 'MarcWeber/vim-addon-mw-utils'
        Plug 'tomtom/tlib_vim'


    " ----------- Interface -----------
        " Improved VIM statusline
        " Plug 'itchyny/lightline.vim'

        " Show marks in the gutter
        Plug 'kshenoy/vim-signature'

        " Reveal highlighting under cursor
        Plug 'gerw/vim-HiLinkTrace'

        " Show information from various sources
        " Plug 'Shougo/unite.vim'

        " Better vim start streen
        Plug 'mhinz/vim-startify'

        " Don't change window layout on buffer delete
        Plug 'qpkorr/vim-bufkill'


    " ----------- General -----------
        " Quickly surround objects with chars
        Plug 'tpope/vim-surround'

        " Easy text exchange operator
        Plug 'tommcdo/vim-exchange'

        " Quickly jump around buffer
        Plug 'justinmk/vim-sneak'

        " Clipboard/register utility
        Plug 'vim-scripts/YankRing.vim'

        " Aligning text
        Plug 'junegunn/vim-easy-align'

        " Easy commenting
        Plug 'tomtom/tcomment_vim'

        " Keyword completion system
        if has('nvim')
            Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        endif

        " Autocomplete quotes, brackets, etc.
        Plug 'jiangmiao/auto-pairs'

        " Extend %
        Plug 'vim-scripts/matchit.zip'

        " Insert mode completion with tab
        Plug 'ervandew/supertab'

        " Syntax error checking
        Plug 'scrooloose/syntastic', { 'on_ft': ['python', 'php', 'javascript'] }

        " Editorconfig
        Plug 'editorconfig/editorconfig-vim'

        " Quickly jump around buffer
        " Plug 'Lokaltog/vim-easymotion'


    " ----------- File/buf management -----------
        " Fuzzy file search
        Plug 'ctrlpvim/ctrlp.vim'

        " File explorer
        Plug 'tpope/vim-vinegar'

        " Auto-detect indentation
        Plug 'tpope/vim-sleuth'

        " Editor config
        Plug 'editorconfig/editorconfig-vim'

        " GIT plugin
        " Plug 'tpope/vim-fugitive'

        " Git repository viewer
        Plug 'gregsexton/gitv'

        " Fast easy & easy find across multiple files
        " Plug 'dkprice/vim-easygrep', { 'on': 'GrepOptions' }

        " Show git repo changes in gutter
        " Plug 'mhinz/vim-signify'

        " Isoloate region for editing
        Plug 'chrisbra/NrrwRgn'


    " ----------- Javascript -----------
        " Better javascript syntax/indenting
        Plug 'pangloss/vim-javascript', { 'for': ['javascript'] } 

        " Json syntax coloring
        Plug 'elzr/vim-json', { 'for': 'json' } 

        " JSX syntax highlighting
        Plug 'mxw/vim-jsx', { 'for': 'javascript' } 

        " Syntax for javascript libraries
        Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'typescript'] }

        " Tern based  code-analysis editing support for javascript
        if has('nvim')
            Plug 'carlitux/deoplete-ternjs', { 'for' : ['javascript'] }
        else
            Plug 'marijnh/tern_for_vim', { 'for': ['javascript'], 'do': 'npm install' }
        endif


    " ----------- PHP -----------
        " TWIG syntax
        Plug 'lumiliet/vim-twig', { 'for': ['html.twig', 'twig'] } 

        " Improved php autocomplete
        Plug 'lvht/phpcd.vim', { 'for': ['html.twig', 'php'], 'do': 'composer install' } 

        " Better php syntax
        Plug 'StanAngeloff/php.vim', { 'for': ['html.twig', 'php'] } 

        " Automatich folding PHP functions
        Plug 'lvht/phpfold.vim', { 'for': ['php'] } 

        " Symfony2 plugin | routing, dic autocompletion, sf console
        Plug 'docteurklein/vim-symfony', { 'for': ['php'] } 


    " ----------- Python -----------
        " Python syntax completion
        if has('nvim')
            Plug 'zchee/deoplete-jedi', { 'for': ['python', 'python3'] } 
        else
            Plug 'davidhalter/jedi-vim', { 'for': ['python', 'python3'] } 
        endi

        " Python-mode utilize those libs
        Plug 'klen/python-mode', { 'for': ['python', 'python3'] } 

        " Enhanced python syntax highlighting
        Plug 'hdima/python-syntax', { 'for': ['python', 'python3'] } 


    " ----------- HTL/CSS -----------
        " HTML5 syntax
        Plug 'othree/html5.vim', { 'for': 'html' } 

        " Automatically close html tag
        Plug 'alvan/vim-closetag', { 'for': 'html' } 

        " CSS3 syntax
        Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'less', 'sass', 'scss'] } 

        " Show CSS colors
        " ** disabled, extremely slow in 256 color terminal **
        " Plug 'skammer/vim-css-color', { 'for': ['css', 'less', 'sass', 'scss'] } 

        " CSS Less support
        Plug 'lunaru/vim-less', { 'for': ['less'] } 

        " CSS Sass support
        Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss','sass'] } 

        " Quick html trough abbrevations
        Plug 'mattn/emmet-vim', { 'for': ['html', 'html.twig'] } 

    " ----------- Other filetypes  -----------
        " fish shell syntax highlighting
        Plug 'aliva/vim-fish', { 'for': 'fish' }
" }}}
call plug#end()



" ----------- Functions -----------

function! s:get_cache_dir(suffix) "{{{
    return resolve(expand(s:cache_dir . '/' . a:suffix))
endfunction "}}}
function! <SID>StripTrailingWhitespaces() " {{{
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
    echo "Trailing whitespace removed"
endfunction " }}}
function! CloseWindowOrKillBuffer() "{{{
    let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))
    " never bdelete a nerd tree
    if matchstr(expand("%"), 'NERD') == 'NERD'
        wincmd c
        return
    endif
    if number_of_windows_to_this_buffer > 1
        wincmd c
    else
        bdelete
    endif
endfunction "}}}

" ----------- Vim settings -----------

" General settings {{{
    set nobackup
    set nowritebackup
    syntax enable


    if  &term=~'linux'
        colorscheme default
    " Ignore 256 color, assume truecolor support
    elseif v:version < 800
        let g:miami_night_use_Xresources = 1
        colorscheme miami-night
    else
        set termguicolors               " Enable true colors
        let g:miami_night_use_truecolor = 1
        colorscheme miami-night
    endif

    " highlight the diff not the code
    " if &diff
        " syntax off
    " endif

    set mouse=a                     " enable mouse

    set hidden                      " don't force write on new buffer open

    set hlsearch                    " highlight search terms
    set incsearch                   " show search matches as you type
    set ignorecase                  " ignore case sensitive search
    set smartcase                   " ignore case if search pattern is all lowercase, case-sensitive otherwise
    set gdefault                    " Replace strings globally by default

    set backspace=indent,eol,start  " backspace for dummys
    set norelativenumber            " don't show linenumbers relative to current line
    " :set number                      " show linenumbers
    set expandtab                   " insert spaces by default
    set autoindent                  " always set auto indenting on
    set smartindent                 " make it smarter
    set copyindent                  " copy the previous indentation on autoindenting
    set shiftwidth=4                " number of spaces to use for autoindenting
    set shiftround                  " round indent to multiple of 'shiftwidth'.  Applies to > and <
    set tabstop=4                   " number of spaces for autoindenting
    set softtabstop=4
    set smarttab                    " insert tabs on the start of a line according to shiftwidth, not tabstop
    set showmatch                   " show matching brackets/parenthesis
    set virtualedit=onemore         " allow for cursor beyond last character

    set encoding=utf-8              " Enable unicode
    set nojoinspaces                " single spaces after sentences

    set scrolloff=1                 " Always show content after scroll
    set scrolljump=5                " Minimum lines to scroll
    " set sidescroll=5              " Scroll 5 chars when moving off the right
    " set sidescrolloff=5           " Scroll when 5 chars from the edge
    set wrap                        " Wrap text
    set linebreak                   " Soft wrap text
    set textwidth=100               " Allow line wrap to work better
    set showbreak=↴                 " Set linebreak character
    set updatecount=50
    set laststatus=0                " Disable statusline

    set history=100                 " remember more commands and search history
    set undolevels=100              " use many muchos levels of undo
    set pastetoggle=<F2>

    set wildmenu                    " enable wild menu for tab-completion
    set wildmode=list:longest,full  " configure wildmenu to behave more like bash
    set wildignore+=*.swp,*.bak,*.pyc,*.class

    set title                       " change the terminal's title
    set novisualbell                " don't beep
    set noerrorbells                " don't beep
    set fillchars+=stl:\─,stlnc:\─,vert:\│,fold:\┄

    set ttimeout
    set ttimeoutlen=50

    set tags=./tags,./TAGS,tags,TAGS,../tags

    if executable('ack')
        set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
        set grepformat=%f:%l:%c:%m
    endif
    if executable('ag')
        set grepprg=ag\ --vimgrep
        set grepformat=%f:%l:%c:%m
    endif
" }}}

" Keyboard shorcuts {{{
    let g:mapleader=","
    nnoremap <F8> :set nonumber!<CR>

    " Move cursor by file line not by screen line
    nnoremap j gj
    nnoremap k gk
    vnoremap j gj
    vnoremap k gk

    noremap <Space> <PageDown>
    noremap <S-Space> <PageUp>

    nnoremap ; :

    " Cancel/exit insert mode
    ino jj <esc>
    cno jj <c-c>
    ino fj <esc>
    cno fj <c-c>

    " Buffer switching with arrowkeys
    nmap <S-right> :bn<CR>
    nmap <S-left> :bp<CR>
    nmap <S-up> :b#
    "nmap  :vert sb #

    " Easy way to navigate between splits
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l
    if has('nvim')
        " Hack to get C-h working in neovim
        nmap <BS> <C-W>h
        tnoremap <Esc> <C-\><C-n>
    endif

    " Clear search
    nmap <silent> ,/ :let @/=""<CR>

    " Move around while in editing mode
    " But c-h cannot be rebound.
    inoremap <C-j> <down>
    inoremap <C-k> <up>
    inoremap <C-l> <right>
    inoremap <C-h> <left>
    inoremap <C-c> <esc>
    " works in gvim only --v
    inoremap <s-enter> <end>;<enter>
    inoremap <c-enter> <end><enter>

    nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
    nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

    " Switch to default regex search
    nnoremap / /\v
    vnoremap / /\v
    nnoremap ? ?\v
    vnoremap ? ?\v

    " Use tab to match bracket pairs
    " nnoremap <tab> %
    " vnoremap <tab> %

    " Make Y behalve like C and D, :help Y.
    nnoremap Y y$

    " visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv
    vnoremap <tab> >gv
    vnoremap <s-tab> <gv

    " Strip al trailing whitespace in the file
    nnoremap <leader>W :call <SID>StripTrailingWhitespaces()<CR>

    " Close window
    nnoremap <silent> Q :call CloseWindowOrKillBuffer()<cr>

    " Open a new a new vertical split and switch to it
    nnoremap <leader>w <C-w>v<C-w>l
    " Open a new a new horizantal split and switch to it
    nnoremap <leader>h <C-w>n<C-w>k

    " Indent after {<CR>
    inoremap {<CR> {<CR>}<Esc>ko

    " Jump to end paragraph in insert mode
    inoremap <C-i> <Esc>}i

    " Select last pasted text
    nnoremap <s-p> V`]
    nnoremap <s-p> V`]

    " Copy/Paste from terminal
    vnoremap <leader>c "+y
    nnoremap <leader>v "+p
    inoremap <C-v> <esc>"+pa
" }}}

" Autocmd, commands {{{
    " Remove trailing trailing comma's in objects in Javascript files
    autocmd BufWritePre *.js silent! %s/,\(\_s*}\)/\1/g

    " Remove trailing whitespace and ^M chars
    autocmd FileType c,cpp,java,php,js,python,html.twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

    " Enable syntax highlighting for less css
    autocmd BufNewFile,BufRead *.less set filetype=less

    " Sort CSS properties
    autocmd BufNewFile,BufRead *.css,*.less nnoremap <buffer> <leader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort/\s*\(-\a*-\\|\)/<CR>:noh<CR>

    " Drupal syntax guidelines
    command! Drupal set filetype=php expandtab tabstop=2 shiftwidth=2 autoindent smartindent

    autocmd FileType vim setlocal fdm=indent keywordprg=:help
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType css,scss,less setlocal foldmethod=marker foldmarker={,}
    autocmd FileType javascript setl sw=2 sts=2 et

    autocmd FileType php let php_folding = 1
    autocmd FileType php let php_parent_error_close = 1
    autocmd FileType php let php_parent_error_open = 1
    autocmd FileType php let php_large_files = 0
" }}}

" OmniComplete {{{
    if has("autocmd") && exists("+omnifunc")
        autocmd Filetype *
            \if &omnifunc == "" |
            \setlocal omnifunc=syntaxcomplete#Complete |
            \endif
    endif

    " some convenient mappings
    inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
    inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
    inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
    inoremap <expr> <C-d> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
    inoremap <expr> <C-u> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

    " automatically open and close the popup menu / preview window
    au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
    set completeopt=menu,preview,longest

    " Enable omni completion.
    autocmd FileType css,less setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
    " autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" }}}

" Statusline {{{
    if has('statusline2')
        " Broken down into easily includeable segments
        set statusline=%<%f\                       " Filename
        set statusline+=%w%h%m%r                   " Options
        set statusline+=%{fugitive#statusline()}   " Git Hotness
        set statusline+=\ [%{&ff}/%Y]              " filetype
        set statusline+=\ [%{getcwd()}]            " current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%    " Right aligned file nav info

        set statusline+=%#warningmsg#
        set statusline+=%*
    endif
" }}}


" ----------- Plugin settings -----------

" deoplete {{{
if has('nvim')
    let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

    " Options
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_ignore_case = 1
    let g:deoplete#enable_smart_case = 1
    let g:deoplete#enable_camel_case = 1
    let g:deoplete#enable_refresh_always = 1
    let g:deoplete#max_abbr_width = 0
    let g:deoplete#max_menu_width = 0

    " Plugin key-mappings.
    inoremap <expr><c-g> deoplete#undo_completion()

    " <CR>: close popup
    " <s-CR>: close popup and save indent.
    inoremap <expr><CR> pumvisible() ? deoplete#close_popup() : "\<CR>"
    inoremap <expr><s-CR> pumvisible() ? deoplete#close_popup() "\<CR>" : "\<CR>"

    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><BS> pumvisible() ? deoplete#close_popup()."\<C-h>" : "\<C-R>=delimitMate#BS()<CR>"
    inoremap <expr><C-y> deoplete#close_popup()
    inoremap <expr><C-e> deoplete#close_popup()

    " Enable heavy omni completion.
    let g:deoplete#ignore_sources = get(g:,'deoplete#ignore_sources',{})
    let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
    let g:deoplete#omni_patterns = get(g:, 'deoplete#omni_patterns', {})

    " javascript
    let g:deoplete#omni#input_patterns.javascript = ['[^. \t0-9]\.\w*']

    " php
    let g:deoplete#omni#input_patterns.php = [
                \'[^. \t0-9]\.\w*',
                \'[^. \t0-9]\->\w*',
                \'[^. \t0-9]\::\w*',
                \]
    let g:deoplete#ignore_sources.php = ['omni', 'around', 'member']
    call deoplete#custom#source('phpcd', 'mark', '')
    call deoplete#custom#source('phpcd', 'input_pattern', '\w*|[^. \t]->\w*|\w*::\w*')

    " c c++
    call deoplete#custom#source('clang2', 'mark', '')
    let g:deoplete#ignore_sources.c = ['omni']   
endif
" }}}

" AutoCloseTag {{{
    " Make it so AutoCloseTag works for other files as well
    " au FileType xhtml,xml,twig ru ftplugin/html/autoclosetag.vim
    " nmap <Leader>ac <Plug>ToggleAutoCloseMappings
" }}}

" CtrlP {{{
    if executable('ag')
        let g:ctrlp_user_command = 'ag %s -l --ignore="*.pyc" --nocolor -g ""'
    endif
    let g:ctrlp_cache_dir = s:get_cache_dir('ctrlp')
    let g:ctrlp_clear_cache_on_exit=1
    let g:ctrlp_max_height=20
    let g:ctrlp_follow_symlinks=1

    nmap <leader>n :CtrlPBuffer<CR>
    nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
" }}}

" Delimitmate {{{
    let delimitMate_autoclose = 1
    let delimitMate_expand_space = 1
    let delimitMate_expand_cr = 1
    " If using html auto complete (complete closing tag)
    au FileType xml,html,xhtml,html.twig,twig let b:delimitMate_matchpairs = "(:),[:],{:}"
    " Jump out of delimiters
    imap <silent> <buffer> <C-Space> <Plug>delimitMateJumpMany
" }}}

" Easygrep {{{
    let g:EasyGrepRecursive=1
    let g:EasyGrepAllOptionsInExplorer=1
    let g:EasyGrepCommand=1
    nnoremap <leader>vo :GrepOptions<cr>
" }}}

" Fugitive {{{
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
    nnoremap <silent> <leader>gw :Gwrite<CR>
    nnoremap <silent> <leader>gr :Gremove<CR>
    autocmd BufReadPost fugitive://* set bufhidden=delete
" }}}

" Jedi-vjm {{{
    " let g:jedi#auto_initialization = 1
    " let g:jedi#popup_on_dot = 0
    " let g:jedi#rename_command = '<leader>R'
    " autocmd FileType python*
    "    \ NeoBundleSource jedi-vim | let b:did_ftplugin = 1
    " let g:neocomplete#sources#omni#input_patterns.python = '[^. \t]\.\w*'
" }}}

" phpcomplete {{{
    let g:phpcomplete_mappings = {
        \ 'jump_to_def': ',j',
        \ }
    let g:php_smart_members=1
    let g:php_alt_properties=1
    let g:php_smart_semicolon=1
    let g:php_alt_construct_parents=1
" }}}

" Python-mode {{{
    " K             Show python docs
    " <Ctrl-Space>  Rope autocomplete
    " <Ctrl-c>g     Rope goto definition
    " <Ctrl-c>d     Rope show documentation
    " <Ctrl-c>f     Rope find occurrences
    " <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
    " [[            Jump on previous class or function (normal, visual, operator modes)
    " ]]            Jump on next class or function (normal, visual, operator modes)
    " [M            Jump on previous class or method (normal, visual, operator modes)
    " ]M            Jump on next class or method (normal, visual, operator modes)
    let g:pymode_rope = 0

    " Documentation
    let g:pymode_doc = 1
    let g:pymode_doc_key = 'K'

    "Linting
    let g:pymode_lint = 1
    let g:pymode_lint_checker = ["pyflakes,pep8"]
    " Auto check on save
    let g:pymode_lint_write = 1

    " Support virtualenv
    let g:pymode_virtualenv = 1

    " Enable breakpoints plugin
    let g:pymode_breakpoint = 1
    let g:pymode_breakpoint_key = '<leader>b'

    " syntax highlighting
    let g:pymode_syntax = 1
    let g:pymode_syntax_all = 1
    let g:pymode_syntax_indent_errors = g:pymode_syntax_all
    let g:pymode_syntax_space_errors = g:pymode_syntax_all

    " Don't autofold code
    let g:pymode_folding = 0
" }}}

" showmarks {{{
    let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let g:showmarks_textlower="\t"
    let g:showmarks_textupper="\t"
" }}}

" Sneak {{{
    let g:sneak#s_next = 1
    " Replace f with sneak
    nmap f <Plug>Sneak_s
    nmap F <Plug>Sneak_S
    xmap f <Plug>Sneak_s
    xmap F <Plug>Sneak_S
    omap f <Plug>Sneak_s
    omap F <Plug>Sneak_S
" }}}

" Sneak {{{
    let g:startify_session_dir = s:get_cache_dir('sessions')
    let g:startify_change_to_vcs_root = 1
    let g:startify_show_sessions = 1
    nnoremap <F1> :Startify<cr>
" }}}

" Syntastic {{{
    let g:syntastic_javascript_checkers = ['eslint']
" }}}

" Symfony2 plugin {{{
    let g:symfony_app_console_caller = "sf"
    let g:symfony_app_console_path = ""
" }}}

" Ultisnips {{{
    let g:UltiSnipsUsePythonVersion = 2
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<c-tab>"

    let g:UltiSnipsSnippetDirectories = ["mysnippets"]
" }}}

" vim-easy-align {{{
    " Start interactive EasyAlign in visual mode
    vmap <leader>a <Plug>(EasyAlign)

    " Start interactive EasyAlign for a motion/text object
    nmap ga <Plug>(EasyAlign)
" }}}

" Vim Unite {{{
    " let bundle = neobundle#get('unite.vim')
    " function! bundle.hooks.on_source(bundle)
    "     call unite#filters#matcher_default#use(['matcher_fuzzy'])
    "     call unite#filters#sorter_default#use(['sorter_rank'])
    "     call unite#custom#source('line,outline','matchers','matcher_fuzzy')
    "     call unite#custom#profile('default', 'context', {
    "                 \ 'start_insert': 1,
    "                 \ 'direction': 'botright',
    "                 \ })
    " endfunction

    " let g:unite_data_directory = s:get_cache_dir('unite')
    " let g:unite_source_history_yank_enable=1
    " let g:unite_source_rec_max_cache_files=10000

    " if executable('ag')
    "     let g:unite_source_grep_command='ag'
    "     let g:unite_source_grep_default_opts='--nocolor --line-numbers --nogroup -S -C4'
    "     let g:unite_source_grep_recursive_opt=''
    " elseif executable('ack')
    "     let g:unite_source_grep_command='ack'
    "     let g:unite_source_grep_default_opts='--no-heading --no-color -C4'
    "     let g:unite_source_grep_recursive_opt=''
    " endif

    " function! s:unite_settings()
    "     nmap <buffer> Q <plug>(unite_exit)
    "     nmap <buffer> <esc> <plug>(unite_exit)
    "     imap <buffer> <esc> <plug>(unite_exit)
    " endfunction

    " autocmd FileType unite call s:unite_settings()
    " nmap <leader><space> [unite]
    " nnoremap [unite] <nop>

    " if s:is_windows
    "     nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec:! buffer file_mru bookmark<cr><c-u>
    "     nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec:!<cr><c-u>
    " else
    "     nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec/async:! buffer file_mru bookmark<cr><c-u>
    "     nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async:!<cr><c-u>
    " endif

    " nnoremap <silent> [unite]e :<C-u>Unite -buffer-name=recent file_mru<cr>
    " nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
    " nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
    " nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<cr>
    " nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
    " nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
    " nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>
" }}}

" YankRing {{{
    let g:yankring_history_dir = s:cache_dir
" }}}


filetype plugin indent on

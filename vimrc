" Configuration file for vim
        set nomodeline                                  " CVE-2007-2438
        set nocompatible                                " explicitly get out of vi-compatible mode

" Plugin Management {
        filetype off                                    " required!
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()

        " Let Vundle manage Vundle (required!)
        " NOTE: comments after Bundle command are not allowed..
        Bundle 'gmarik/vundle'

        " My bundles
        Bundle 'scrooloose/nerdtree'
        Bundle 'jistr/vim-nerdtree-tabs'
        Bundle 'scrooloose/nerdcommenter'
        Bundle 'kien/ctrlp.vim'
        Bundle 'majutsushi/tagbar'
        Bundle 'mileszs/ack.vim'
        Bundle 'scrooloose/syntastic'
        Bundle 'terryma/vim-multiple-cursors'
        Bundle 'tpope/vim-surround'
        Bundle 'nathanaelkane/vim-indent-guides'
        Bundle 'lunaru/vim-less'
        Bundle 'nvie/vim-flake8'
        Bundle 'pangloss/vim-javascript'
        Bundle 'wlangstroth/vim-racket'

        filetype plugin indent on                       " required!

        " Brief help
        " :BundleList           - list configured bundles
        " :BundleInstall(!)     - install (update) bundles
        " :BundleSearch(!) foo  - search (or refresh cache first) for foo
        " :BundleClean(!)       - confirm (or auto-approve) removal of unused bundles
" }

" Basics {
        syntax on                                       " syntax highlighting on
        set noexrc                                      " don't use local version of .(g)vimrc, .exrc
        set ai                                          " auto indenting
        set hlsearch                                    " highlight the last searched term
        set background=dark                             " we plan to use a dark background
        set history=100                                 " keep 100 lines of history
        set mouse=a                                     " enable mouse usage (all modes)
        set backspace=2                                 " more powerful backspacing
        set tabstop=2                                   " insert 2 spaces for a tab
        set softtabstop=2                               " delete 2 spaces at a time
        set shiftwidth=2                                " insert 2 spaces for indentation
        set expandtab                                   " insert spaces when press tab

        autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
        autocmd FileType c,cpp,java setlocal shiftwidth=8 tabstop=8 softtabstop=8
        autocmd FileType sh,csh,zsh,vim,awk setlocal shiftwidth=8 tabstop=8 softtabstop=8
" }

" General {
        set encoding=utf-8
        set smartcase
        set incsearch                                   " search as you type
        set list
        set listchars=tab:▸\ ,trail:▫
        set backspace=indent,eol,start                  " make backspace a more flexible
        set backup                                      " make backup files
        set backupdir=~/.vim/backup                     " where to put backup files
        set directory=~/.vim/tmp                        " directory to place swap files in
        set wildmode=longest,list,full
        set wildmenu
        let mapleader=','

        " Otherwise yank/paste breaks when running inside tmux
        if $TMUX == ''
                set clipboard+=unnamed                  " share windows clipboard
        endif
" }

" Key Mapping {
        inoremap jk <ESC>
        nnoremap k gk
        nnoremap j gj
        nnoremap q b

        " Disable arrow keys to learn hjkl
        nnoremap <up> <nop>
        nnoremap <down> <nop>
        nnoremap <left> <nop>
        nnoremap <right> <nop>
        inoremap <up> <nop>
        inoremap <down> <nop>
        inoremap <left> <nop>
        inoremap <right> <nop>

        " Switch between windows
        nnoremap <C-h> <C-w>h
        nnoremap <C-j> <C-w>j
        nnoremap <C-k> <C-w>k
        nnoremap <C-l> <C-w>l

        " NERDTree
        nnoremap <C-n> :NERDTreeMirrorToggle<CR>

        " Buffer-related
        nnoremap fd :bn<CR>
        nnoremap df :bp<CR>
        nnoremap <leader>bw :call WipeOutHiddenBuffers()<CR>

        " Tagbar
        nnoremap <C-t> :TagbarToggle<CR>
" }

" Vim UI {
        set laststatus=2                                " always show the status line
        set sidescrolloff=10                            " keep 5 lines at the size
        set number                                      " turn on line numbers
        set ruler                                       " always show current positions along the bottom
        set showmatch                                   " show matching brackets
        set colorcolumn=80                              " display a line length marker
        set t_Co=256                                    " enable 256 colors
        " colorscheme smyck
" }

" Plug-in Settings {
        let g:flake8_show_quickfix=0
        let g:flake8_show_in_gutter=1

        let g:syntastic_javascript_checkers=['jshint']
        let g:syntastic_typescript_checkers=['tslint']
        let g:syntastic_enable_racket_racket_checker=1

        let g:NERDTreeWinSize=35
        let g:tagbar_width=35

        " ctrlp
        let g:ctrlp_working_path_mode='ra'
        let g:ctrlp_custom_ignore = {
                \ 'dir': '\v[\/]\.(git|hg|svn)|node_modules|bower_components$',
                \ 'file': '\v\.(DS_Store|o|pyc|orig)',
        \ }

        " vim-multiple-cursors
        let g:multi_cursor_use_default_mapping=0        " reserve <C-n> for NerdTree
        let g:multi_cursor_next_key='<C-m>'
        let g:multi_cursor_quit_key='<ESC>'

        if executable('coffeetags')
                let g:tagbar_type_coffee = {
                        \ 'ctagsbin': 'coffeetags',
                        \ 'ctagsargs': '',
                        \ 'kinds': ['f:functions', 'o:object'],
                        \ 'sro': ".",
                        \ 'kind2scope' : { 'f': 'object', 'o': 'object' }
                \ }
        endif

        " vim-indent-guides
        let g:indent_guides_start_level=2
        let g:indent_guides_guide_size=1

        " nerdcommenter
        let g:NERDSpaceDelims=1
" }

" GUI Settings {
        if has("gui_running")
                set guifont=Menlo:h12
                set mousehide                           " hide the mouse cursor when typing
                if has("gui_macvim")
                        set transparency=2
                        set guioptions=egmrt            " hide the toolbar in MacVim
                endif
        endif
" }

" Event Handlers {
        if has("autocmd")
                " Run vimrc immediately after updating it
                " autocmd BufWritePost .vimrc source $MYVIMRC
                " When editing a file, always jump to the last cursor position
                autocmd BufReadPost * :call JumpToLastCursorPosition()
                " Don't write backup file if vim is being called by "crontab -e"
                autocmd BufWrite /private/tmp/crontab.* set nowritebackup
                " Don't write backup file if vim is being called by "chpass"
                autocmd BufWrite /private/etc/pw.* set nowritebackup
                " Set syntax highlight for .hamlc as .haml
                autocmd BufRead,BufNewFile *.hamlc set ft=haml
                " Display warning when file is changed on disk
                autocmd FileChangedShell * echo "Warning: File changed on disk"
                " Check Python syntax against PEP8
                autocmd BufWritePost *.py call Flake8()
        endif
" }

" Custom Helpers {
        function! WipeOutHiddenBuffers()
                " Get a list of all active buffers in all tabs
                let l:active_buffers = []
                for i in range(1, tabpagenr('$'))
                        call extend(l:active_buffers, tabpagebuflist(i))
                endfor

                " Delete any buffer that is loaded but not active
                let l:delete_count = 0
                for j in range(1, bufnr('$'))
                        if buflisted(j) && index(l:active_buffers, j) < 0
                                execute 'bwipeout ' . j
                                let l:delete_count += 1
                        endif
                endfor
                echom l:delete_count . ' buffer(s) deleted.'
        endfunction

        function! JumpToLastCursorPosition()
                if !exists("g:leave_my_cursor_position_alone")
                        if line("'\"") > 0 && line ("'\"") <= line("$")
                                exe "normal g'\""
                        endif
                endif
        endfunction
" }

" Configuration file for vim
        set nomodeline                                " CVE-2007-2438
        set nocompatible                              " explicitly get out of vi-compatible mode

" Plugin Management {
        filetype off                                  " required!
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()

        " Let Vundle manage Vundle (required!)
        " NOTE: comments after Bundle command are not allowed..
        Bundle 'gmarik/vundle'
        
        " My bundles
        Bundle 'mileszs/ack.vim'
        Bundle 'scrooloose/nerdtree'
        Bundle 'fholgado/minibufexpl.vim'
        Bundle 'majutsushi/tagbar'
        Bundle 'tpope/vim-fugitive'
        Bundle 'tpope/vim-rails'
        Bundle 'kien/ctrlp.vim'
        Bundle 'scrooloose/nerdcommenter'
        Bundle 'scrooloose/syntastic'
        Bundle 'jistr/vim-nerdtree-tabs'
        Bundle 'tpope/vim-surround'
        Bundle 'kchmck/vim-coffee-script'

        filetype plugin indent on                     " required!
        
        " Brief help
        " :BundleList           - list configured bundles
        " :BundleInstall(!)     - install (update) bundles
        " :BundleSearch(!) foo  - search (or refresh cache first) for foo
        " :BundleClean(!)       - confirm (or auto-approve) removal of unused bundles
" }

" Basics {
        syntax on                                     " syntax highlighting on
        set noexrc                                    " don't use local version of .(g)vimrc, .exrc
        set ai                                        " auto indenting
        set hlsearch                                  " highlight the last searched term
        set background=dark                           " we plan to use a dark background
        set history=100                               " keep 100 lines of history
        set mouse=a                                   " enable mouse usage (all modes)
        set backspace=2                               " more powerful backspacing
        set tabstop=2                                 " insert 2 spaces for a tab
        set shiftwidth=2                              " insert 2 spaces for indentation
        set expandtab                                 " insert spaces when press tab

        autocmd FileType c,cpp,java setlocal shiftwidth=8 tabstop=8
        autocmd FileType sh,csh,zsh setlocal shiftwidth=8 tabstop=8
" }

" General {
        set backspace=indent,eol,start                " make backspace a more flexible
        set backup                                    " make backup files
        set backupdir=~/.vim/backup                   " where to put backup files
        set clipboard+=unnamed                        " share windows clipboard
        set directory=~/.vim/tmp                      " directory to place swap files in
        let mapleader=','
" }

" Key Mapping {
        inoremap jk <ESC>
        nnoremap k gk
        nnoremap j gj
        nnoremap q b

        " disable arrow keys to learn hjkl
        nnoremap <up> <nop>
        nnoremap <down> <nop>
        nnoremap <left> <nop>
        nnoremap <right> <nop>
        inoremap <up> <nop>
        inoremap <down> <nop>
        inoremap <left> <nop>
        inoremap <right> <nop>

        " fast split screen
        nnoremap <leader>v <C-w><C-v>
        nnoremap <leader>s <C-w><C-s>

        " switch between windows
        nnoremap <C-h> <C-w>h
        nnoremap <C-j> <C-w>j
        nnoremap <C-k> <C-w>k
        nnoremap <C-l> <C-w>l

        " markdown to html
        nnoremap <leader>md :read! markdown %:p > %:p:r.html<CR>

        " NERDTree stuff
        nnoremap <C-n> :NERDTreeMirrorToggle<CR>

        " buffer stuff
        nnoremap <leader>b :ls<CR>:b<Space>
        nnoremap fd :bn<CR>
        nnoremap df :bp<CR>

        " tagbar stuff
        nnoremap <C-t> :TagbarToggle<CR>

        " fugitive stuff
        nnoremap <leader>gs :Gstatus<CR>
        nnoremap <leader>gd :Gdiff<CR>
        nnoremap <leader>gc :Gcommit<CR>
        nnoremap <leader>gb :Gblame<CR>
        nnoremap <leader>gl :Glog<CR>
        nnoremap <leader>gp :Git push<CR>
" }

" Vim UI {
        set laststatus=2                              " always show the status line
        set sidescrolloff=10                          " Keep 5 lines at the size
        set number                                    " turn on line numbers
        set ruler                                     " Always show current positions along the bottom
        set showmatch                                 " show matching brackets
" }

" GUI Settings {
        if has("gui_running")
                colorscheme smyck                     " set color scheme
                set guifont=Menlo:h11                 " set font
                set mousehide                         " hide the mouse cursor when typing
                if has("gui_macvim")
                        set transparency=2            " set transparency if possible
                        set guioptions=egmrt          " hide the toolbar in MacVim
                endif
        endif
" }

" When editing a file, always jump to the last cursor position autocmd BufReadPost *
        \ if ! exists("g:leave_my_cursor_position_alone") |
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \ exe "normal g'\"" |
        \ endif |
        \ endif

if has("autocmd")
        " Run vimrc immediately after updating it
        autocmd BufWritePost .vimrc source $MYVIMRC
        " Don't write backup file if vim is being called by "crontab -e"
        autocmd BufWrite /private/tmp/crontab.* set nowritebackup
        " Don't write backup file if vim is being called by "chpass"
        autocmd BufWrite /private/etc/pw.* set nowritebackup
        " Set syntax highlight for .hamlc as .haml
        autocmd BufRead,BufNewFile *.hamlc set ft=haml
        " Display warning when file is changed on disk
        autocmd FileChangedShell * echo "Warning: File changed on disk"
endif

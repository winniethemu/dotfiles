" Configuration file for vim
set modelines=0                                       " CVE-2007-2438

call pathogen#runtime_append_all_bundles()            " start pathogen
call pathogen#helptags()                              " generate the help tags

" Basics {
        syntax on                                     " syntax highlighting on
        set nocompatible                              " explicitly get out of vi-compatible mode
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

        autocmd FileType c setlocal shiftwidth=8 tabstop=8
" }

" General {
        filetype on                                   " turn on filetype detection
        filetype plugin indent on                     " load filetype plugins/indent settings
        set backspace=indent,eol,start                " make backspace a more flexible
        set backup                                    " make backup files
        set backupdir=~/.vim/backup                   " where to put backup files
        set clipboard+=unnamed                        " share windows clipboard
        set directory=~/.vim/tmp                      " directory to place swap files in
        let mapleader=","
" }

" Key Mapping {
        inoremap jk <Esc>
        inoremap k <Esc>gka
        inoremap j <Esc>gja
        nnoremap k gk
        nnoremap j gj
        nnoremap q :q<CR>
        nnoremap save :w<CR>
        nnoremap wq :wq<CR>
        
        " disable arrow keys to learn hjkl
        nnoremap <up> <nop>
        nnoremap <down> <nop>
        nnoremap <left> <nop>
        nnoremap <right> <nop>
        inoremap <up> <nop>
        inoremap <down> <nop>
        inoremap <left> <nop>
        inoremap <right> <nop>

        nnoremap <leader>i :!irb<CR>
        nnoremap <leader>s :sh<CR>
        nnoremap <leader>d :NERDTreeMirrorToggle<CR>
        nnoremap <leader>n :noh<CR>

        " markdown to html
        nnoremap <leader>md :%! /usr/local/bin/markdown --html4tags<CR>
  
        " fast change text inside parentheses/brackets
        nnoremap p9 ci(
        nnoremap p[ ci[
        nnoremap p' ci'
        nnoremap p'' ci"

        " fast split screen
        nnoremap vv <C-w><C-v>
        nnoremap ss <C-w><C-s>

        " ctrl-p stuff
        nnoremap pp <C-p>

        " buffer stuff
        nnoremap ls :ls<CR>
        nnoremap bb :bp<CR>
        nnoremap ff :bn<CR>
	      nnoremap bd :bd<CR>

        " navigate around a rails project (requires rails.vim)
        nnoremap <leader>c :Rcontroller<CR>
        nnoremap <leader>m :Rmodel<CR>
        nnoremap <leader>v :Rview<CR>
        nnoremap <leader>a :A<CR>

        " switch between windows
        nnoremap <tab>w <C-w><C-w>
" }

" Command Aliases {
        " vim session management (requires sessionman.vim)
        command L SessionOpenLast
        command SX SessionClose
        command S SessionSave
        command SS SessionSaveAs
        command SL SessionShowLast
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
        autocmd BufWritePost .vimrc source #MYVIMRC 
        " Don't write backup file if vim is being called by "crontab -e"
        autocmd BufWrite /private/tmp/crontab.* set nowritebackup
        " Don't write backup file if vim is being called by "chpass"
        autocmd BufWrite /private/etc/pw.* set nowritebackup
endif

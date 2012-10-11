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
        let g:neocomplcache_enable_at_startup = 1     " load neocomplcache.vim on startup
" }

" Key Mapping {
        inoremap jk <Esc>
        nnoremap k gk
        nnoremap j gj
        nnoremap q b
        nnoremap sv :w<CR>
        nnoremap <leader>i :!irb<CR>
        nnoremap <leader>h :noh<CR>
        
        " disable arrow keys to learn hjkl
        nnoremap <up> <nop>
        nnoremap <down> <nop>
        nnoremap <left> <nop>
        nnoremap <right> <nop>
        inoremap <up> <nop>
        inoremap <down> <nop>
        inoremap <left> <nop>
        inoremap <right> <nop>

        " fast change text inside parentheses/brackets
        nnoremap p9 ci(
        nnoremap p[ ci[
        nnoremap p' ci'
        nnoremap p'' ci"

        " fast split screen
        nnoremap <leader>v <C-w><C-v>
        nnoremap <leader>s <C-w><C-s>

        " switch between windows
        nnoremap <tab>w <C-w><C-w>

        " markdown to html
        nnoremap <leader>md :read! markdown %:p > %:p:r.html<CR>

        " NERDTree stuff
        nnoremap <leader>n :NERDTreeMirrorToggle<CR>

        " buffer stuff
        nnoremap <leader>f :bp<CR>
        nnoremap <leader>g :bn<CR>

        " tagbar stuff
        nnoremap <leader>tt :TagbarToggle<CR>

        " fugitive stuff
        nnoremap <leader>gs :Gstatus
        nnoremap <leader>gd :Gdiff
        nnoremap <leader>gc :Gcommit
        nnoremap <leader>gb :Gblame
        nnoremap <leader>gl :Glog
        nnoremap <leader>gp :Git push
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
endif

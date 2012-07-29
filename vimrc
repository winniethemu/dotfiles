" Configuration file for vim
set modelines=0			" CVE-2007-2438

call pathogen#runtime_append_all_bundles()      " start pathogen
call pathogen#helptags()                        " generate the help tags

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
  imap jk <Esc>
  imap <up> <Esc>gka
  imap <down> <Esc>gja
  nmap <up> gk
  nmap <down> gj
  nmap q :q<CR>
  nmap save :w<CR>
  nmap wq :wq<CR>
  nmap <leader>i :!irb<CR>
  nmap <leader>s :sh<CR>

  map <leader>d :NERDTree<CR>
  map <leader>n :noh<CR>

  " markdown to html
  nmap <leader>md :%! /usr/local/bin/markdown --html4tags<CR>
  
  " fast change text inside parentheses/brackets
  imap p9 <ESC>ci(
  imap p[ <ESC>ci[
  nmap p9 ci(
  nmap p[ ci[

  " fast split screen
  nmap vv <C-w><C-v>
  nmap ss <C-w><C-s>

  " ctrl-p stuff
  nmap pp <C-p>

  " go to next/previous buffer
  nmap <leader>[ :bp<CR>
  nmap <leader>] :bn<CR>

  " navigate around a rails project (requires rails.vim)
  map <leader>c :Rcontroller<CR>
  map <leader>m :Rmodel<CR>
  map <leader>v :Rview<CR>
  map <leader>a :A<CR>

  " re-map arrow keys to switching between windows
  nmap <S-up> :wincmd k<CR>
  nmap <S-down> :wincmd j<CR>
  nmap <S-left> :wincmd h<CR>
  nmap <S-right> :wincmd l<CR>
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
  " Basics {
    colorscheme smyck                          	" set color scheme
    set guifont=Menlo:h11                       " set font
    set mousehide                               " hide the mouse cursor when typing
  " }
    if has("gui_macvim")
      set transparency=2                        " set transparency if possible
      set guioptions=egmrt                      " hide the toolbar in MacVim
    endif
  endif
" }

" When editing a file, always jump to the last cursor position autocmd BufReadPost *
            \ if ! exists("g:leave_my_cursor_position_alone") |
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \ exe "normal g'\"" |
            \ endif |
            \ endif

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup


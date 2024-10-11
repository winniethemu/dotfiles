#!/usr/bin/env zsh

CONFIG=$HOME/.config
DOTFILES=$CONFIG/dotfiles
ZSH=$HOME/.zsh

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install tmux
brew install reattach-to-user-namespace

# Config
mkdir -p $CONFIG/dotfiles
git clone https://github.com/winniethemu/dotfiles.git $CONFIG/dotfiles

ln -s $DOTFILES/vimrc $HOME/.vimrc
ln -s $DOTFILES/tmux.conf $HOME/.tmux.conf

# Zsh plugins
mkdir -p $ZSH

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH/zsh-autosuggestions
echo "source ${(q-)PWD}/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/zsh-syntax-highlighting
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

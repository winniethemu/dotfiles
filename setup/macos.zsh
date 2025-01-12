#!/usr/bin/env zsh

CONFIG=$HOME/.config
DOTFILES=$CONFIG/dotfiles
ZSH=$HOME/.zsh

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install tmux
brew install autojump
brew install reattach-to-user-namespace

# Config
mkdir -p $CONFIG/dotfiles
git clone https://github.com/winniethemu/dotfiles.git $CONFIG/dotfiles

ln -s $DOTFILES/vimrc $HOME/.vimrc
ln -s $DOTFILES/tmux.conf $HOME/.tmux.conf
ln -s $DOTFILES/zshrc $HOME/.zshrc

# Zsh plugins
mkdir -p $ZSH

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH/zsh-autosuggestions
echo "source ${ZSH}/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

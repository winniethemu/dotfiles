# Custom prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
PROMPT='%~ %F{blue}${vcs_info_msg_0_}%f$ '
RPROMPT=''
zstyle ':vcs_info:git:*' formats '(%b)'

# Case insensitive tabs
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias gp="git pull -p"
alias gg="git push"

# Plugins
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

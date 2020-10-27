# Path to your oh-my-zsh installation.
export ZSH="/home/jhorn/.oh-my-zsh"
export EDITOR=nvim

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git golang docker docker-compose node npm sudo tmux rust cargo fzf)

source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8

# Add $HOME/.local/bin to the path
export PATH=$HOME/.local/bin:$PATH

# Rust
source $HOME/.cargo/env

# alias
alias cls=clear

# don't share history
unsetopt share_history

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

# git config alias
alias cfg='/usr/bin/git --git-dir=$HOME/configs/ --work-tree=$HOME'

neofetch

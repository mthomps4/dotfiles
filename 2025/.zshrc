# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(git asdf node fzf zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias vim='nvim'
alias dotconfig='nvim ~/.config'
alias zshrc='nvim ~/.zshrc'
alias dockerstart='systemctl start docker'
alias dockerstop='systemctl stop docker'
alias dockerstatus='systemctl status docker'
alias purgeimages='docker rmi -f $(docker images -a -q)'
alias purgecontainers='docker rm -f $(docker ps -a -q)'
alias poststatus='systemctl status postgresql'
alias poststart='systemctl start postgresql'
alias poststop='systemctl stop postgresql'
alias masterprune="git branch | grep -v \"master\" | xargs git branch -D"
alias tools="cat ~/.tool-versions"
alias grep_3000="lsof -i tcp:3000"
alias ta="tmux a -t"
alias tls="tmux ls"
alias detach="tmux detach"
alias rnew="rails new -d postgresql -c tailwind -j esbuild"

# ASDF 
. "$HOME/.asdf/asdf.sh"

# PG Flags 
export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"

# FZF 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"

# Starship theming 
eval "$(starship init zsh)"

# Git Editor 
export GIT_EDITOR="nvim"
export GIT_SEQUENCE_EDITOR="nvim"

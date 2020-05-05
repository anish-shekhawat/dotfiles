# /etc/zsh/zshrc: system-wide .zshrc file for zsh(1).
#
# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin
source /etc/profile
# source ~/.zsh/zsh-git/zshrc.sh
# PROMPT='%B%m%~%b $(git_super_status) %# '
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
alias tmux="TERM=xterm-256color tmux"

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# unalias run-help
autoload run-help

alias ls="ls --group-directories-first --color=auto"
# Some tmux-related shell aliases

# Attaches tmux to the last session; creates a new session if none exists.
alias t='tmux attach-session'

# Attaches tmux to a session (example: ta portal)
alias ta='tmux a -t'

# Creates a new session
alias tn='tmux new -s'

# Lists all ongoing sessions
alias tl='tmux list-sessions'

#rg alias to exlude certain directories and ignore case
alias rg='rg --smart-case -g "!linux*"'

#rg alias to search for file names
alias rgf='rg --files -g'

# Directory navigation.
alias -- -='cd -'
alias ..='cd ..'
alias ...='..; ..'
alias ..3='..2; ..'
alias ..4='..3; ..'
alias ..5='..4; ..'

alias fixssh='eval $(tmux showenv -s SSH_AUTH_SOCK)'

# local branch list
function gllist {
  git for-each-ref --sort=-committerdate refs/ --format="%(color:green)%(committerdate:iso8601) %(color:red)%(refname:short) %(color:yellow)%(authorname)%(color:reset) %(contents:subject)" | sed "s/refs\/heads\///g" | sed ${1-15}q
}

[ -s "/home/anishss/.scm_breeze/scm_breeze.sh" ] && source "/home/anishss/.scm_breeze/scm_breeze.sh"

# Settings for Spaceship prompt
fpath=( "$HOME/.zfunctions" $fpath )
autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_GIT_STATUS_SHOW=false
SPACESHIP_EXIT_CODE_SHOW=true

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  exit_code     # Exit code section
  exec_time     # Execution time of the last command
)

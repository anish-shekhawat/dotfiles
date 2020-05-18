# /etc/zsh/zshrc: system-wide .zshrc file for zsh(1).
#
# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' actionformats '%b'

# Set up the prompt (with git branch name)
setopt prompt_subst
NEWLINE=$'\n'
PROMPT='%{$fg_no_bold[yellow]%}%n %{$reset_color%}at %{$fg_bold[green]%}$NAMEANDROLE%{$reset_color%} in %{$fg_bold[cyan]%}%~%{$reset_color%} on %{$fg_no_bold[magenta]%}${vcs_info_msg_0_}%{$reset_color%}${NEWLINE}~ '

# TODO: Add zsh-git
source ~/.zsh/zfunctions/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zfunctions/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# unalias run-help
autoload run-help

# load aliases
if [ -f ~/.zsh/zshalias ]; then
    source ~/.zsh/zshalias
else
    print "404: ~/.zsh/zshalias not found."
fi

if [ -f ~/.zsh/machine_alias ]; then
    source ~/.zsh/machine_alias
else
    print "404: ~/.zsh/machine_alias not found."
fi

alias fixssh='eval $(tmux showenv -s SSH_AUTH_SOCK)'

# local branch list
function gllist {
  git for-each-ref --sort=-committerdate refs/ --format="%(color:green)%(committerdate:iso8601) %(color:red)%(refname:short) %(color:yellow)%(authorname)%(color:reset) %(contents:subject)" | sed "s/refs\/heads\///g" | sed ${1-15}q
}

[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

# Settings for Spaceship prompt
fpath=( "$HOME/.zsh/zfunctions" $fpath )
result=$(zsh --version | awk '{print $2}' | awk -F'.' '{s=($1 > 5 || ($1==5 && $2 >= 1))?"1":"0"; print s}')
if [ $result -gt "0" ]; then
    autoload -U promptinit; promptinit
    prompt spaceship
fi

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
  line_sep      # Line break
  char          # Prompt character
)

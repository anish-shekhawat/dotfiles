#!bin/sh

mkdir -p $HOME/tools
mkdir -p $HOME/.zsh/zfunctions

# setup zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zfunctions/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search $HOME/.zsh/zfunctions/zsh-history-substring-search

# setup zsh prompt
git clone https://github.com/denysdovhan/spaceship-prompt.git $HOME/.zsh/zfunctions/spaceship-prompt
ln -sf "$HOME/.zsh/zfunctions/spaceship-prompt/spaceship.zsh" "$HOME/.zsh/zfunctions/prompt_spaceship_setup"

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

# Copy .zsh files
cp .zshrc $HOME/.zshrc
cp .zshalias $HOME/.zsh/zshalias

source $HOME/.zshrc

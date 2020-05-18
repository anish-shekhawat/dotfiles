#!bin/sh

mkdir -p $HOME/tools
mkdir -p $HOME/.zsh/zfunctions
TOOLS="$HOME/tools"

# setup zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zfunctions/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search $HOME/.zsh/zfunctions/zsh-history-substring-search

# setup zsh prompt
git clone https://github.com/denysdovhan/spaceship-prompt.git $HOME/.zsh/zfunctions/spaceship-prompt
ln -sf "$HOME/.zsh/zfunctions/spaceship-prompt/spaceship.zsh" "$HOME/.zsh/zfunctions/prompt_spaceship_setup"

# setup tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Copy .zsh files
ln -sf "$TOOLS/zshrc" "$HOME/.zshrc"
ln -sf "$TOOLS/zshalias" "$HOME/.zsh/zshalias"
ln -sf "$TOOLS/vimrc" "$HOME/.vimrc"
ln -sf "$TOOLS/tmux.conf" "$HOME/.tmux.conf"

zsh -c "source $HOME/.zshrc"

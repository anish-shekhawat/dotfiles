#!bin/sh

mkdir -p $HOME/tools

# setup zsh prompt
git clone https://github.com/denysdovhan/spaceship-prompt.git $HOME/tools
mkdir $HOME/.zfunctions
ln -sf "$HOME/tools/spaceship-prompt/spaceship.zsh" "$HOME/.zfunctions/prompt_spaceship_setup"

# Copy .zshrc
cp .zshrc $HOME/.zshrc

#!/usr/bin/env bash

SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
SRC_DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )

# Install vim if it is not already installed.
sudo apt install vim

# Install all of the plugins.
vim -u "$SRC_DIR"/.vimrc +PlugInstall +qall

clear

echo "Setup complete!"
echo "Be sure to copy the .vimrc file located in ~/.vim to your home directory or place a copy wherever vim searches for a .vimrc file."




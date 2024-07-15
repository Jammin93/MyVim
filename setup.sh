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

#########################################################
# Install dependencies for conquer of completion (coc). #
#########################################################
# Install Node.js.
# If the link changes, go here: https://nodejs.org/en/download/package-manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install 20

sudo apt install npm
npm install --global yarn

# Install all of the plugins while we're at it.
vim +PlugInstall +qall

# Install coc. This will open vim and must be the last piece of code that runs.
vim -u "$SRC_DIR"/.vimrc -c "call coc#util#install()"

clear

echo "Setup complete!"
echo "Be sure to copy the .vimrc file located in ~/.vim to your home directory or place a copy wherever vim searches for a .vimrc file."




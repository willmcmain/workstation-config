#! /bin/bash

# Install nvm
git clone https://github.com/creationix/nvm.git ~/.nvm
nvm install node
nvm use node

# Install yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update
sudo apt install -y --no-install-recommends yarn

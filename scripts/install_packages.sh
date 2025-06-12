#!/usr/bin/env bash

echo 'Lets install some junk!'
if test ! $(which brew); then
  echo 'Installing homebrew...'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update

PACKAGES=(
  autojump
  aws-cli
  eslint
  git
  mysql
  neovim
  node
  nvm
  postgresql
  rbenv
  ripgrep
  ruby-build
  tmux
  watchman
  wget
  yarn
  zsh
  zsh-completions
)

echo 'Installing packages...'
brew install ${PACKAGES[@]}

echo 'Running Cleanup'
brew cleanup

CASKS=(
  docker
  gimp
  google-chrome
  iterm2
  karabiner-elements
  postgres
  postman
  slack
  spotify
)

echo 'Installing cask apps...'
brew install --cask ${CASKS[@]}

echo 'Installing fonts...'
brew tap homebrew/cask-fonts
FONTS=(
  font-clear-sans
  font-inconsolidata
  font-materialdesignicons-webfont
  font-meslo-lg
  font-meslo-nerd-font
  font-meslo-for-powerline
  font-raleway
  font-roboto
)
brew install --cask ${FONTS[@]}

echo 'Installing ruby bundler...'
RUBY_GEMS=(
  bundler
)
sudo gem install ${RUBY_GEMS[@]}

echo 'Installing yo, react-native-cli, @angular/cli, create-react-app...'

npm install -g yo
npm install -g react-native-cli
npm install -g @angular/cli
npm install -g create-react-app

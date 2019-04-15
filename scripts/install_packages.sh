echo 'Lets install some junk!'
if test ! $(which brew); then
  echo 'Installing homebrew...'
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
  the_silver_searcher
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

echo 'Installing cask...'
brew install cask

CASKS=(
  docker
  google-chrome
  iterm2
  karabiner-elements
  postgres
  postman
  slack
  spotify
  unity
)

echo 'Installing cask apps...'
brew cask install ${CASKS[@]}

echo 'Installing fonts...'
brew tap caskroom/fonts
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
brew cask install ${FONTS[@]}

echo 'Installing ruby bundler...'
RUBY_GEMS=(
  bundler
)
sudo gem install ${RUBY_GEMS[@]}

echo 'Installing some npm global packages...'

npm install -g yo
npm install -g react-native-cli
npm install -g @angular/cli

echo "Dotfiles: install"
## Get rights
sudo -v

## Install Brew if not here
if ! type "brew" > /dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

## Install ZSH if not here
if ! type "/usr/local/bin/zsh" > /dev/null; then
  brew install zsh
  echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/zsh
  echo "Restart terminal"
fi

source ./homebrew/Brewfile

if [ ! -f "$HOME/.gitconfig" ]; then
  ln -s ./dotfiles/config/GitConfig ~/.gitconfig
fi

if [ ! -f "$HOME/.vimrc" ]; then
  ln -s ./dotfiles/config/Vim ~/.vimrc
fi

if [ ! -f "$HOME/.zprofile" ]; then
  ln -s ./dotfiles/config/ZProfile ~/.zprofile
fi

apm install nuclide
apm install docblockr

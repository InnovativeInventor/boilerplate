sudo apt-get install software-properties-common curl -y
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install neovim -y
sudo apt-get install fish -y

## For Pyenv 
## TODO: Check if this is all necessary
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git


git clone https://github.com/InnovativeInventor/dotfiles

## Getting vim setup
mv dotfiles/.vimrc ~/.vimrc
mv dotfiles/.vim ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

## Getting fish setup
mkdir -p ~/.Config
mv -n dotfiles/fish ~/.Config/fish
curl -L https://get.oh-my.fish | fish
curl -L https://raw.githubusercontent.com/InnovativeInventor/boilerplate/master/setup/fish-setup.fish
fish fish-setup.fish
sudo chsh -s /usr/bin/fish $USER
sudo rm -r dotfiles fish-setup.fish

## Getting pyenv and pyenv-virtualenv setup
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv


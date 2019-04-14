sudo apt-get install software-properties-common curl -y
sudo apt-add-repository ppa:fish-shell/release-3 -y
sudo apt-get update
sudo apt-get install neovim fish opam -y

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
mkdir -p ~/.config
cp -rn dotfiles/fish ~/.config/
curl -L https://get.oh-my.fish | fish
curl -L https://raw.githubusercontent.com/InnovativeInventor/boilerplate/master/setup/fish-setup.fish
fish fish-setup.fish
sudo chsh -s /usr/bin/fish $USER
sudo rm -r dotfiles fish-setup.fish

## Getting pyenv and pyenv-virtualenv setup
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

echo "Add Fura Code Retina Nerd Font Complete to your terminal font"
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Fura Code Retina Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Retina/complete/Fura%20Code%20Retina%20Nerd%20Font%20Complete.otf

## OCaml/Logic stuff
opam init -y
opam install depext -y
opam depext conf-gtksourceview.2 -y # Make sure this is up to date
opam depext conf-m4.1 -y            # Make sure this is up to date
opam install coqide -y

sudo apt install python3-dev python3-pip python3-setuptools
sudo pip3 install thefuck

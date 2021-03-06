sudo apt-get install software-properties-common curl -y
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_9.0/ /' > /etc/apt/sources.list.d/shells:fish:release:3.list
curl -L https://download.opensuse.org/repositories/shells:fish:release:3/Debian_9.0/Release.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install neovim fish opam terminator -y
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker $USER

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

## Getting pyenv and pyenv-virtualenv setup
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

echo "Add Fura Code Retina Nerd Font Complete to your terminal font"
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Fura Code Retina Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Retina/complete/Fura%20Code%20Retina%20Nerd%20Font%20Complete.otf

## OCaml/Logic stuff
opam init -y
opam install depext -y
opam install coqide -y

sudo apt install python3-dev python3-pip python3-setuptools -y
sudo pip3 install thefuck powerline-shell

## Getting fish setup
mkdir -p ~/.config
cp -rn dotfiles/fish ~/.config/
curl -L https://get.oh-my.fish | fish
curl -L https://raw.githubusercontent.com/InnovativeInventor/boilerplate/master/setup/fish-setup.fish
fish fish-setup.fish
sudo chsh -s /usr/bin/fish $USER
sudo rm -r dotfiles fish-setup.fish

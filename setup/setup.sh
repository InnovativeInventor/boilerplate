sudo apt-get install software-properties-common curl -y
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install neovim -y
sudo apt-get install fish -y

git clone https://github.com/InnovativeInventor/dotfiles
mv dotfiles/.vimrc ~/.vimrc
mv dotfiles/.vim ~/.vim
vim +PluginInstall +qall
mkdir -p ~/.Config
mv -n dotfiles/fish ~/.Config/fish
curl -L https://get.oh-my.fish | fish
curl -L https://raw.githubusercontent.com/InnovativeInventor/boilerplate/master/setup/fish-setup.fish
fish fish-setup.fish
sudo rm -r dotfiles fish-setup.fish

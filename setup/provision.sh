# For Debian/Ubuntu
sudo apt-get update

## Homebrew requirements
sudo apt-get install screen build-essential curl file git -y
echo | sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> ~/.profile
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
brew install gcc fish neovim exa fd fzf
yes | /home/linuxbrew/.linuxbrew/opt/fzf/install

source ~/.profile

## Setting up spellcheck and git repos
mkdir ~/git
git clone https://github.com/InnovativeInventor/dict4schools ~/git/dict4schools

## Getting Vim ready
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -L https://raw.githubusercontent.com/InnovativeInventor/dotfiles/master/.vimrc -o ~/.vimrc
curl -L https://raw.githubusercontent.com/InnovativeInventor/dotfiles/master/.vimrc -o /usr/share/vim/vimrc
echo 'set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf' >> .vimrc
vim +PluginInstall +qall

## Setting up fish
sudo su -c 'echo "/home/linuxbrew/.linuxbrew/bin/fish" >> /etc/shells'
echo 'set -g fish_user_paths "/home/linuxbrew/.linuxbrew/bin" $fish_user_paths' >> ~/.config/fish/config.fish
sudo su -c "chsh -s /home/linuxbrew/.linuxbrew/bin/fish root"
sudo su -c "chsh -s /home/linuxbrew/.linuxbrew/bin/fish $1"
sudo su -c "chsh -s /home/linuxbrew/.linuxbrew/bin/fish $USER"

## Installing omf and packages
curl -L https://get.oh-my.fish -o fish-install.sh
/home/linuxbrew/.linuxbrew/bin/fish -c 'fish fish-install.sh --noninteractive --yes'
source ~/.profile
/home/linuxbrew/.linuxbrew/bin/fish -c 'source ~/.config/fish/config.fish'
/home/linuxbrew/.linuxbrew/bin/fish -c 'omf repositories add https://github.com/InnovativeInventor/fish-personal'
/home/linuxbrew/.linuxbrew/bin/fish -c 'omf install bass bobthefish expand dev-fish'
/home/linuxbrew/.linuxbrew/bin/fish -c 'screen omf reload'
sleep 1
rm fish-install.sh

## Getting rust ready
curl https://sh.rustup.rs -sSf | sh -s -- -y 

## Installing my utilities
cargo install eva

## Getting Docker setup
if [ "$1" != "" ]; then
    echo "Installing Docker . . ."
    curl -fsSL https://get.docker.com -o docker.sh
    sudo sh docker.sh
    sudo usermod -aG docker $USER
    rm docker.sh
fi

## Entering fish
echo "Finished provisioning!"
/home/linuxbrew/.linuxbrew/bin/fish

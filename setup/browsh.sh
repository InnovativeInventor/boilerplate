sudo apt-get update
echo "" | sudo add-apt-repository ppa:keithw/mosh-dev
sudo apt-get update
sudo apt-get install mosh wget

wget https://github.com/browsh-org/browsh/releases/download/v1.6.4/browsh_1.6.4_linux_amd64.deb
sudo apt install ./browsh_1.6.4_linux_amd64.deb -y
rm ./browsh_1.6.4_linux_amd64.deb
#browsh

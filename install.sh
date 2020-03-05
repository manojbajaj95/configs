# Add repositories
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
# Update
sudo apt -y update
sudo apt -y upgrade
sudo apt -y full-upgrade
## Install
# Essentials
sudo apt-get install -y wget curl zsh git rename vim make httpie htop snapd tree sl apt-transport-https xclip apt-transport-https
sudo apt-get install -y libcurl4-openssl-dev libssl-dev
# Dev tools
# sudo snap install code --classic
# sudo apt-get install -y tilda
# C++
bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
sudo apt-get install -y build-essential cmake
# Javascript
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
sudo apt-get install -y nodejs
# Python
sudo apt-get install -y python-pip python-dev build-essential 
sudo pip install --upgrade pip
sudo pip install --upgrade virtualenv
wget https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh; bash Anaconda3-5.3.1-Linux-x86_64.sh
# Customization
sudo apt-get -y install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Useful terminal stuff 
sudo apt install -y cmatrix 
sudo apt install -y cowsay 
sudo apt install -y dcfldd 
sudo apt install -y ffmpeg 
sudo apt install -y fortune-mod 
sudo apt install -y htop 
sudo apt install -y icoutils 
sudo apt install -y mediainfo 
sudo apt install -y neofetch 
sudo apt install -y pv 
sudo apt install -y youtube-dl

# Useful gui programs
sudo apt install -y firefox
sudo apt install -y libreoffice

# Start linking to configs
rm ~/.bashrc ~/.zshrc ~/.p10k.zsh
ln -s `dirname $0`/bashrc ~/.bashrc
ln -s `dirname $0`/zshrc ~/.zshrc
ln -s `dirname $0`/p10k.zsh ~/.p10k.zsh

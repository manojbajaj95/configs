# Add repositories
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
# Update
sudo apt -yqq update
sudo apt -yqq upgrade
sudo apt -yqq full-upgrade
## Install
# Essentials
sudo apt-get install -yqq wget curl git rename vim make httpie htop snapd tree sl apt-transport-https xclip apt-transport-https
sudo apt-get install -yqq libcurl4-openssl-dev libssl-dev
# Dev tools
sudo snap install code --classic
# sudo apt-get install -yqq tilda
# C++
sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
sudo apt-get install -yqq build-essential cmake ninja-build
sudo apt-get install -yqq clang-tidy clang-format
# Javascript
sudo curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
sudo apt-get install -yqq nodejs
# Python
sudo apt-get install -yqq python-pip python-dev build-essential 
sudo pip install --upgrade pip
sudo pip install --upgrade virtualenv
if [ ! -d $HOME/anaconda* ]; then
    wget https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh; bash Anaconda3-5.3.1-Linux-x86_64.sh
fi
# Customization (Optional)
sudo apt-get -yqq install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k ] && git clone -q --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
[ ! -d ~/.vim/bundle/Vundle.vim ] && git clone -q --depth=1 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ] && git clone -q --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ] && git clone -q --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
[ ! -f /etc/bash.command-not-found ] && sudo wget -O /etc/bash.command-not-found https://raw.githubusercontent.com/hkbakke/bash-insulter/master/src/bash.command-not-found

# Useful terminal stuff 
sudo apt install -yqq cmatrix 
sudo apt install -yqq cowsay 
sudo apt install -yqq dcfldd 
sudo apt install -yqq ffmpeg 
sudo apt install -yqq fortune-mod 
sudo apt install -yqq htop 
sudo apt install -yqq icoutils 
sudo apt install -yqq mediainfo 
sudo apt install -yqq neofetch 
sudo apt install -yqq pv 
sudo apt install -yqq youtube-dl
# Useful gui programs
# sudo apt install -yqq firefox
# sudo apt install -yqq libreoffice

# Start linking to configs
rm -f ~/.bashrc ~/.zshrc ~/.p10k.zsh ~/.vimrc
ln -s "$HOME/configs/bashrc" ~/.bashrc
ln -s "$HOME/configs/zshrc" ~/.zshrc
ln -s "$HOME/configs/p10k.zsh" ~/.p10k.zsh
ln -s "$HOME/configs/vimrc" ~/.vimrc

# Most setup done; start finishing it off
#exec zsh
#vundle-init;vundle;vundle update

# Final steps- for real
sudo apt -yqq autoremove
rm -f Anaconda*
rm -f packages*

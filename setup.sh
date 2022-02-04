#!/usr/bin/bash

sudo apt update
sudo apt install nodejs -y
sudo apt install npm -y
sudo npm install n -g
sudo n latest
sudo apt install curl -y
sudo apt install tmux -y
sudo apt-get install silversearcher-ag
sudo apt install clang-format -y
sudo apt-get install python3-pip -y
pip3 install pynvim
#Install clang-13
echo "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-13 main" >> /etc/apt/sources.list
echo "deb-src http://apt.llvm.org/focal/ llvm-toolchain-focal-13 main" >> /etc/apt/sources.list
sudo apt update
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
sudo apt install clang-13 clangd-13 clang-format-13 -y

echo "export TERM=xterm-256color" >> ~/.bashrc
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim



curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

./nvim.appimage --appimage-extract

mv squashfs-root /
ln -s /squashfs-root/AppRun /usr/bin/nvim

mkdir -p ~/.config/nvim
#copy init.vim to
cp init.vim ~/.config/nvim/init.vim
cp coc-settings.json ~/.config/nvim/


#Adding cwd tools
mkdir ~/tools && cd ~/tools && git clone https://github.com/vushu/cwd_tools.git

echo "source ~/tools/cwd_tools/cwd_tools" >> ~/.bashrc
echo "Adding nvim aliases"

echo "alias v='nvim'" >> ~/.bashrc
echo "alias vi='nvim'" >> ~/.bashrc
echo "alias vim='nvim'" >> ~/.bashrc
echo "export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g \"\"'" >> ~/.bashrc


nvim +PlugInstall +qall
nvim +'CocInstall -sync coc-clangd' +qall
nvim +CocUpdateSync +qall

echo "source ~/.bashrc"


#!/bin/bash

echo "Do you want to install dependencies?"
echo -n "y/n: "
read REPLAY

if [ "$REPLAY" == "y" ] 
then
        pacman -S --needed ninja libtool autoconf automake cmake gcc-c++ gettext-tools git zsh tmux curl ripgrep
fi

# neovim
cd
NVIM_DIR="~/local/neovim"

function install_nvim () {
	mkdir -p "~/local"
        git clone https://github.com/neovim/neovim $NVIM_DIR
        cd $NVIM_DIR
	make
	make install
        # make CMAKE_BUILD_TYPE=Release
        # make CMAKE_INSTALL_PREFIX=$HOME/local/nvim install
}

if  command -v nvim &> /dev/null
then
        echo "Do you want to update the neovim file?"
        echo -n "y/n: "
        read -r
        if [ "$REPLAY" == "y" ] 
        then
                git pull && install_nvim
        fi
else
        echo "Installing  fresh nvim"
        install_nvim
fi

# oh-my-zsh 
OHMYZSH_DIR="$HOME/.oh-my-zsh/"
if [ ! -d "$OHMYZSH_DIR" ] 
then
        cd
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# oh-my-tmux
OHMYTMUX_DIR="$HOME/.tmux/"
if [ ! -d "$OHMYTMUX_DIR" ] 
then
	cd
        git clone https://github.com/gpakosz/.tmux.git ~/local/.tmux
        ln -s -f ~/local/.tmux/.tmux.conf
        cp ~/local/.tmux/.tmux.conf.local .
fi

# oacs dot fiels
echo "Do you want to update the dotfiles?"
echo -n "y/n: "
read -r
if [ "$REPLAY" == "y" ] 
then
        bash load
fi

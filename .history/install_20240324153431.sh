#!/usr/bin/bash

# <-- System -->
## Update system
 echo 'Update system...'
  sudo apt update && sudo apt upgrade -y
 
 echo 'Installing: Git, curl, wget, unzip, phyton3, zsh'
  sudo apt install -y git curl wget unzip python3 vim zsh python3-pip
 
 echo 'Installing: Volta'
 curl https://get.volta.sh | bash
 volta install node

# <-- Fonts -->  
mkdir -p ~/.local/share/fonts/

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip

unzip Iosevka.zip -d ~/.local/share/fonts/
unzip RobotoMono.zip -d ~/.local/share/fonts/

fc-cache -fv

# <-- Web Navigators -->
 echo 'Installing: Chrome'
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb

# <-- Applications -->  
## Install apps
 echo 'Installing: Flameshot'
  sudo apt install -y flameshot

 echo 'Installing postman'
  sudo snap install postman

 echo 'Installing filezilla'
  sudo apt-get install -y filezilla
 echo 'Installing: Alacritty.'
  sudo snap install alacritty --classic
 
 echo 'Installing: Sublime.'
  sudo snap install sublime-text --classic
 
 echo 'Installing: VSC.'
  sudo snap install code --classic
 
 echo 'Installing: Webstorm.'
  sudo snap install webstorm --classic 
 
 echo 'Installing: arc-theme'
  sudo apt install -y arc-theme
 
 echo 'Installing: i3'
  sudo apt install -y i3-wm i3status suckless-tools i3blocks 
  sudo apt install -y feh lxappearance compton numlockx pulseaudio-utils pavucontrol papirus-icon-theme
 
 echo 'Installing: rofi'
  sudo apt install -y rofi
 echo 'Installing: tmux'
  sudo snap install tmux --classic
echo 'Installing meson'
 sudo apt-get install -y meson libxcb-shape0-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev autoconf meson
 sudo apt-get install -y libxcb-render-util0-dev libxcb-shape0-dev libxcb-xfixes0-dev 
 echo 'Installing: i3-gaps'
  pip install ninja
  git clone https://www.github.com/Airblader/i3 i3-gaps
  cd i3-gaps && mkdir -p build && cd build && meson ..
  ninja
  sudo ninja install
  cd ../..

## Stack BACK
echo 'Installing: Mysql'
 sudo apt install mysql-server
 sudo systemctl status mysql
 sudo mysql_secure_installation
 snap install mysql-workbench-community
echo 'Installing: PostgresSQL'

# Step 1 — Installing PostgreSQL
 sudo apt update
 sudo apt install postgresql postgresql-contrib
 sudo systemctl start postgresql.service
 sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main"
 sudo tee /etc/apt/sources.list.d/pgadmin4.list
 sudo apt install pgadmin4
# Step 2 — Creating a New Role
#  sudo -u postgres createuser --interactive --pwprompt

# Step 3 - Accessing 
# sudo -u postgres psql

# connection string
# https://linuxhint.com/understand-postgres-connection-string/
#  postgers://localhost
#If a username and a password are needed, the updated URI looks like this:
#  postgres://<username>:<password>@localhost
echo 'Installing: Xampp'

sudo -s
apt update
apt upgrade
wget chmod +x xampp-linux-x64-7.1.10-0-installer.run
chmod +x xampp-linux-x64-7.1.10-0-installer.run
./xampp-linux-x64-7.1.10-0-installer.run

#In order to start all the xampp services, we need to run the following command in the terminal:
/opt/lampp/xampp start
/opt/lampp/xampp stop
/opt/lampp/xampp restart

#Start Apache only:
/opt/lampp/xampp startapache
/opt/lampp/xampp stopapache

#Start Proftpd FTP server only:
/opt/lampp/xampp startftp
/opt/lampp/xampp stopftp

#Start MySQL Database server only:
/opt/lampp/xampp startmysql
/opt/lampp/xampp stopmysql

#Xampp help
/opt/lampp/xampp --help

#Xampp uninstall
/opt/lampp/uninstall

## Copy configurations into ~/.config
 mkdir -p ~/.config/i3
 mkdir -p ~/.config/rofi
 mkdir -p ~/.config/compton
 mkdir -p ~/.config/alacritty

 cp .config/i3/config ~/.config/i3/config
 cp .config/i3/i3blocks.conf ~/.config/i3/i3blocks.conf
 cp .config/i3/clipboard_fix.sh ~/.config/i3/clipboard_fix.sh
 cp .config/rofi/config ~/.config/rofi/config
 cp .config/compton/compton.conf ~/.config/compton/compton.conf
 cp .config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

 cp .fehbg ~/.fehbg
 cp -r .wallpaper ~/.wallpaper 

# <-- Bash --> 
 sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


echo "After reboot: Select i3 on login, run lxappearance and select arc-dark"
echo 'The setup was successfully established.'



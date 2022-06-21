#!/bin/bash

# ==> Het vernieuwen van de repo's <==
echo "Repositories vernieuwen..."
sudo apt update

# ==> Installeren van de Webbrowser "Brave" <==
sudo apt install -y apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install -y brave-browser


# ==> Installeren van Spotify <==
echo "Installeren Spotify..."
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt-get update && sudo apt-get install -y spotify-client

# ==> Installeren van Python <==

# Downloaden van de installatiebestanden
echo "Downloaden Installatie-bestanden Python..."
wget "https://www.python.org/ftp/python/3.10.5/Python-3.10.5.tgz"

# Uitpakken zip-file
log "Uitpakken van de zip-file..."
gzip -d Python-3.10.5.tgz

# Starten van de installatie
log "Installeren van Python..."
sudo apt-get install -y python3.10

# ==> Installeren Oracle VirtualBox <==
 
# Bestanden ophalen 
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -

# Virtualbox repo toevoegen
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian focal contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

# Updaten repo's
sudo apt update

# Starten van de installatie
sudo apt install -y virtualbox-6.1

# ==> Installeren van Discord <==

# Nosnap bestand verwijderen indien dit aanwezig is
sudo rm /etc/apt/preferences.d/nosnap.pref 

# Installeren nodige package
sudo apt install snapd 

# Installeren Discord
sudo snap install discord 

# Discord opstarten en laten installen
discord 

# ==> Installeren Flameshot (gelijkaardige tool aan Lightshot) <== 
sudo apt install -y flameshot 

# ==> Installeren Visual Studio Code <==
sudo snap install code --classic

# ==> Installeren Notepad++ <==
sudo snap install notepad-plus-plus 

# ==> Installeren 7-Zipp <==
sudo apt-get install p7zip-full p7zip-rar

# ==> Installeren WinRAR <==
wget rarlab.com/rar/rarlinux-x64-5.1.1.tar.gz

ar -zxvf rarlinux-x64-5.1.1.tar.gz

cd rar/

sudo make

sudo make install 

cd

# ==> Installeren Adobe Acrobat Reader <== 
wget -O ~/adobe.deb ftp://ftp.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/AdbeRdr9.5.5-1_i386linux_enu.deb

sudo dpkg --add-architecture i386

sudo apt update

sudo apt install -y libxml2:i386 libcanberra-gtk-module:i386 gtk2-engines-murrine:i386 libatk-adaptor:i386

sudo apt install -y ./adobe.deb 

# ==> Installeren VIM <==
sudo apt install -y vim 

# ==> Installeren FileZilla <==
sudo apt install -y filezilla 

# ==> Installeren MS Teams <==
wget https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.4.00.26453_amd64.deb

sudo apt install ./teams_1.4.00.26453_amd64.deb

# ==> Installeren Wine <==
sudo apt install -y wine # -> Wine is een tool die ervoor zorgt dat je ook nog gebruik kan maken van MS producten!

# ==> Installeren Bitwarden (Password-Manager) <==
sudo snap install bitwarden  

# ==> Installeren draw.io <== 
sudo snap install drawio 

# ==> Installatie git <== 
sudo apt update 

sudo apt install -y git

# ==> Installatie Vagrant <==
sudo apt-get install -y vagrant  

mkdir ~/vagrant 

cd ~/Vagrant

vagrant init debs http://puppet-vagrant-boxes.puppetlabs.com/debian-73-x64-virtualbox-nocm.box

# ==> Installatie JabReff <==
sudo snap install jabref 

# ==> Installatie MikiTex <==
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D6BC243565B2087BC3F897C9277A7293F59E4889

echo "deb http://miktex.org/download/ubuntu focal universe" | sudo tee /etc/apt/sources.list.d/miktex.list

sudo apt-get update

sudo apt-get install -y miktex

# ==> Installatie TeXstudio <==
sudo add-apt-repository ppa:sunderme/texstudio

sudo apt remove texstudio-doc texstudio-l10n

sudo apt update

sudo apt install -y texstudio


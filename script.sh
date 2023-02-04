# Path: script.sh
#!/bin/bash
# Install TP-Link TL-WN722N drivers for your wifi hacking
sudo apt update -y && sudo apt upgrade -y
sudo apt install bc build-essential libelf-dev linux-headers-$(uname -r) -y
sudo apt install dkms -y
sudo rmmod r8188eu
sudo git clone https://github.com/aircrack-ng/rtl8188eus
cd rtl8188eus
echo "blacklist r8188eu" | sudo tee /etc/modprobe.d/realtek.conf
sudo make
sudo make install
sudo modprobe 8188eu
echo "Install complete, rebooting now"
reboot now

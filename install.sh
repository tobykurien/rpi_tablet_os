#!/bin/sh
echo "Installing Raspberry Pi Tablet OS..."
sudo apt update
sudo apt full-upgrade
sudo apt install -y onboard at-spi2-core git libgles2-mesa libgles2-mesa-dev xorg-dev bluetooth bluez blueman pulseaudio libqt4-dev libx11-6 libxtst-dev libgrail6 dconf-cli
sudo apt remove -y bluealsa

rm -rf rpi_tablet_os
git clone https://github.com/tobykurien/rpi_tablet_os.git rpi_tablet_os
cd rpi_tablet_os/fs
sudo cp -r * /

# fix ownership of files in pi home directory
sudo chown -R pi:pi /home/pi

sudo dpkg -i install /home/pi/touchegg_*.deb

dconf load /org/onboard/ < ~/onboard.dconf

echo "Installation complete, rebooting..."
sleep 10s
sudo reboot

#!/bin/sh
echo "Installing Raspberry Pi Tablet OS..."
sudo apt update
sudo apt full-upgrade
sudo apt install onboard git libgles2-mesa libgles2-mesa-dev xorg-dev bluetooth bluez blueman pulseaudio

git clone https://github.com/tobykurien/rpi_tablet_os.git rpi_tablet_os
cd rpi_tablet_os/fs
sudo cp -r * /

echo "Installation complete, rebooting..."
sleep 10s
sudo reboot

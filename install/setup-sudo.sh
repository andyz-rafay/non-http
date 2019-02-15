# Set up sudo
sudo usermod -a -G sudo jenkins &&  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

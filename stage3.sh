#!/bin/bash

# Script for compiling Linux kernel and installing necessary tools with GRUB

# Download the Linux kernel source code (replace the URL with the desired version)
kernel_version="5.10.10"
wget https://www.kernel.org/pub/linux/kernel/v5.x/linux-$kernel_version.tar.xz
tar -xf linux-$kernel_version.tar.xz
cd linux-$kernel_version

# Configure the kernel (you can adjust the configuration based on your needs)
make menuconfig

# Compile the kernel
make -j$(nproc)

# Install the kernel modules
sudo make modules_install

# Install the kernel itself
sudo make install

# Install GRUB to the disk (replace /dev/sdX with the appropriate disk identifier)
sudo grub-install /dev/sdX

# Update the GRUB configuration
sudo update-grub

echo "Level 3 completed: Linux kernel compiled and installed, necessary tools configured with GRUB."

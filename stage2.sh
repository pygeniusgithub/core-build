#!/bin/bash

# Script for preparing disk, formatting, and mounting on Fedora

# Detect available disks using lsblk
target_disk=$(lsblk -p -n -o NAME,TYPE | awk '$2=="disk"{print $1}')
echo "Detected disk: $target_disk"

# Partition the disk using parted
sudo parted $target_disk mklabel msdos
sudo parted -a optimal $target_disk mkpart primary ext4 0% 100%

# Format the partition as ext4
sudo mkfs.ext4 ${target_disk}1

# Mount the partition to a specified directory
sudo mkdir /mnt/mydisk
sudo mount ${target_disk}1 /mnt/mydisk

echo "Level 2 completed: Disk prepared, formatted, and mounted on Fedora."

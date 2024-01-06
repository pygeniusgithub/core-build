#!/bin/bash

# Script for preparing the system by installing needed libraries

# Update the package manager and install required libraries
sudo dnf update
sudo dnf install -y gcc make ncurses-devel flex bison openssl-devel elfutils-libelf-devel

# Additional libraries or dependencies can be added based on specific requirements

echo "Level 1 completed: System prepared with necessary libraries."

#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to print steps
function print_step() {
    echo
    echo "===================="
    echo "$1"
    echo "===================="
    echo
}

# Remove old Docker versions
print_step "Removing old Docker versions (if any)..."
sudo apt remove -y docker docker-engine docker.io containerd runc || echo "Old versions not found."

# Update the apt package index and install prerequisites
print_step "Updating package index and installing prerequisites..."
sudo apt update
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker’s official GPG key
print_step "Adding Docker's official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --batch --yes --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the stable repository
print_step "Setting up Docker stable repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

# Install Docker Engine
print_step "Installing Docker Engine..."
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Add the current user to the docker group
print_step "Adding the current user to the Docker group..."
sudo usermod -aG docker "$USER"

print_step "Docker installation complete. Log out and back in or run 'newgrp docker' to use Docker without sudo."

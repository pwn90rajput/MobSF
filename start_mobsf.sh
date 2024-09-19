#!/bin/bash

# Function to install Docker if not already installed
install_docker() {
    echo "Docker is not installed. Installing Docker..."
    sudo apt update
    sudo apt install -y docker.io
    echo "Docker installation complete."
}

# Check if Docker is installed
if ! command -v docker &> /dev/null
then
    install_docker
else
    echo "Docker is already installed."
fi

# Start Docker service
echo "Starting Docker service..."
sudo service docker start

# Check if Docker service started successfully
if [[ $? -ne 0 ]]; then
    echo "Failed to start Docker service. Please check the Docker installation or service status."
    exit 1
fi

# Pull the latest version of MOBSF from the Docker repository
echo "Pulling the latest version of Mobile Security Framework (MOBSF)..."
sudo docker pull opensecurity/mobile-security-framework-mobsf

# Run the MOBSF framework
echo "Starting MOBSF on port 8000..."
sudo docker run -it -p 8000:8000 opensecurity/mobile-security-framework-mobsf

# Output the URL to access MOBSF
echo "MOBSF is running. You can access it at: http://0.0.0.0:8000"


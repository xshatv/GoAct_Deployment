#!/bin/bash
sudo apt-get update -y
# Installation of DOCKER
# Add the official Docker GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# Add the Docker repository:
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# Install the necessary dependencies:
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo usermod -aG docker $USER && newgrp docker
# Installation of MINIKUBE
# Download the latest Minikube binary:
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
# Copy the Minikube binary to /usr/local/bin:
sudo cp minikube-linux-amd64 /usr/local/bin/minikube
# Give the Minikube executable the proper permissions:
sudo chmod +x /usr/local/bin/minikube
# Installation of KUBECTL
# Download the binary executable file:
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
# Give the kubectl binary executable permission:
chmod +x kubectl
# Move the kubectl binary to /usr/local/bin:
sudo mv kubectl /usr/local/bin/

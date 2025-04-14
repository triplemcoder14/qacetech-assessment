#!/bin/bash

set -e

echo "udating packages and installing dependencies..."
sudo apt update -y
sudo apt install -y docker.io curl conntrack git

echo "starting Docker service..."
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ubuntu

# install kubectl
echo "installing kubectl..."
KUBECTL_VERSION=$(curl -s https://dl.k8s.io/release/stable.txt)
curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# install Minikube
echo "installing Minikube..."
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64

# set docker as driver and start Minikube
echo "starting Minikube..."
minikube start --driver=docker --force

# clone the repo
echo "cloning repository..."
mkdir project
cd /home/ubuntu/project
git clone -b main https://github.com/triplemcoder/qacetech-assessment.git
cd qacetech-assessment

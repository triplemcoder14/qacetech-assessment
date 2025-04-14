#!/bin/bash

sudo apt update -y
sudo apt install -y docker.io curl conntrack git

# install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64

# start docker
sudo systemctl start docker
sudo usermod -aG docker ubuntu

# clone repo
mkdir project
cd /home/ubuntu/project
git clone -b main https://github.com/triplemcoder14/qacetech-assessment.git

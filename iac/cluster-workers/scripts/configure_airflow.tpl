#!/bin/bash

LOG_FILE="/var/log/installer.log"

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    # Docker is not installed, perform installation steps
    echo "$(date +"%Y-%m-%d %T") - Docker not detected. Installing Docker..." >> "$LOG_FILE"

    # Add Docker's official GPG key
    apt-get update
    apt-get install -y ca-certificates curl
    install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      tee /etc/apt/sources.list.d/docker.list > /dev/null
    apt-get update

    # Install Docker components
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    # Check if docker group exists before creating it
    if ! getent group docker &> /dev/null; then
        groupadd docker
    fi

    # Add user to the docker group
    usermod -aG docker ubuntu

    # Join Docker swarm
    echo "$(date +"%Y-%m-%d %T") - Joining Docker swarm..." >> "$LOG_FILE"
    docker swarm join --token ${manager_swarm_id} ${manager_ip} >> "$LOG_FILE" 2>&1
fi


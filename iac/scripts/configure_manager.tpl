#!/bin/bash

LOG_FILE="/var/log/installer.log"

# Function to get the private IP address of the instance
get_private_ip() {
    local_ip=$(hostname -I | awk '{print $1}')
    echo "$local_ip"
}

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    # Install Docker
    echo "$(date +"%Y-%m-%d %T") - Docker not detected. Installing Docker..." >> "$LOG_FILE"
    yum update -y >> "$LOG_FILE"
    yum install -y docker >> "$LOG_FILE"

    # Start Docker service
    systemctl start docker >> "$LOG_FILE"
    systemctl enable docker >> "$LOG_FILE"

    # Verify Docker installation
    docker --version >> "$LOG_FILE"

    # Initialize Docker Swarm with the local private IP address
    private_ip=$(get_private_ip)
    echo "$(date +"%Y-%m-%d %T") - Initializing Docker Swarm with private IP: $private_ip" >> "$LOG_FILE"
    docker swarm init --advertise-addr "$private_ip" >> "$LOG_FILE"

    # Deploy Portainer
    echo "$(date +"%Y-%m-%d %T") - Deploying Portainer..." >> "$LOG_FILE"
    curl -L https://downloads.portainer.io/ce2-19/portainer-agent-stack.yml -o portainer-agent-stack.yml >> "$LOG_FILE"
    docker stack deploy -c portainer-agent-stack.yml portainer >> "$LOG_FILE"
else
    echo "$(date +"%Y-%m-%d %T") - Docker is already installed." >> "$LOG_FILE"
fi

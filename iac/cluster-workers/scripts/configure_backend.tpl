#!/bin/bash

LOG_FILE="/var/log/installer.log"

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    # Install Docker
    echo "$(date +"%Y-%m-%d %T") - Docker not detected. Installing Docker..." >> "$LOG_FILE"
    yum update -y >> "$LOG_FILE"
    yum install -y docker >> "$LOG_FILE"

    # Start Docker service
    systemctl start docker >> "$LOG_FILE"
    systemctl enable docker >> "$LOG_FILE"

    # Check if docker group exists before creating it
    if ! getent group docker &> /dev/null; then
        groupadd docker
    fi

    # Add ec2-user to the docker group
    usermod -aG docker ec2-user

    # Join Docker swarm
    echo "$(date +"%Y-%m-%d %T") - Joining Docker swarm..." >> "$LOG_FILE"
    docker swarm join --token ${manager_swarm_id} ${manager_ip} >> "$LOG_FILE" 2>&1
fi

#!/bin/bash

LOG_FILE="/var/log/installer.log"

# Check if Docker is installed
if ! command -v docker &> /dev/null
then
    # Install Docker
    echo "$(date +"%Y-%m-%d %T") - Docker not detected. Installing Docker..." >> "$LOG_FILE"
    yum update -y >> "$LOG_FILE"
    yum install -y docker >> "$LOG_FILE"

    # Start Docker service
    systemctl start docker >> "$LOG_FILE"
    systemctl enable docker >> "$LOG_FILE"

    # Verify Docker installation
    docker --version >> "$LOG_FILE"
else
    echo "$(date +"%Y-%m-%d %T") - Docker is already installed." >> "$LOG_FILE"
fi

# Add your additional commands here...
echo "$(date +"%Y-%m-%d %T") - Creating installer.sh file" >> "$LOG_FILE"
touch installer.sh
echo "$(date +"%Y-%m-%d %T") - Appending text to installer.sh file" >> "$LOG_FILE"
echo "I am speaking with a friend" >> installer.sh

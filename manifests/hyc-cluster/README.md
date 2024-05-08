# Portainer Swarm Cluster

## Background

This Swarm Cluster facilitates efficient management and continuous deployment of containerized applications through the use of Portainer.

## Purpose of Portainer

Portainer serves two primary functions within the Swarm Cluster:

1. **Cluster Management:** Portainer provides a user-friendly interface for managing the resources and configurations of the cluster. It allows administrators to monitor the health of the cluster, scale services, and perform various administrative tasks efficiently.

2. **Continuous Deployment:** Portainer simplifies the process of deploying containerized applications onto the cluster. It streamlines the deployment pipeline, enabling developers to deploy new versions of applications seamlessly and rapidly iterate on their code.

## Steps to Install Portainer

1. **Install Docker on Master:**
   - Update package lists:
     ```
     sudo yum update
     ```
   - Install Docker:
     ```
     sudo yum install docker -y
     ```
   - Start Docker service:
     ```
     sudo systemctl start docker
     ```
2. **Initialize Swarm on Master:**
   - Ensure all required incoming ports are open in your NSG for Swarm.
   - Run the following command on the master node:
     ```
     sudo docker swarm init --advertise-addr <PRIVATE MASTER IP>
     ```
   - Run the subsequent command provided on the worker node.
   
3. **Install Portainer:**
   - Follow the instructions provided [here](https://docs.portainer.io/start/install-ce/server/swarm/linux) to install Portainer on your Swarm cluster.
   
4. **Restart Container if Necessary:**
   - If you encounter an error prompting you to restart the container, use the following command:
     ```
     sudo docker container restart <container-id>
     ``` 

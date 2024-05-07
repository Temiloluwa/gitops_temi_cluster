# Swarm Cluster

## Background

- Portainer servers for cluster management and continous deployment of cluster manifests.

## Steps to Install Portainer

1. Install docker on master
Ensure all the required incoming ports are open in your NSG for swarm
```
sudo yum update
sudo yum install docker -y
sudo systemctl start docker

```
2. Run on master

```
sudo docker swarm init --advertise-addr <PRIVATE MASTER IP>

```
run the subsequent command on the worker

3. Install Portainer using the instructions (here)[https://docs.portainer.io/start/install-ce/server/swarm/linux].

4. If you get an error stating you need to restart container

```
sudo docker container restart <container-id>

```

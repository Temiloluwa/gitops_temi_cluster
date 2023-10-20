# Swarm Cluster on EC2

## Background
- Number of nodes in the cluster: 2 (one master, one worker)
- Instance type: T2 instances

## Steps

1. Install docker on master and worker (This should be done by the configuration management e.g tf provisioner, ansible)
Ensure all the required incoming ports are open in your NSG for swarm
```
sudo yum install docker -y

```
2. Run on master

```
sudo docker swarm init --advertise-addr <PRIVATE MASTER IP>

```
run the subsequent command on the worker

3. Install Portainer using the instructions (here)[https://docs.portainer.io/start/install-ce/server/swarm/linux]. Open port 9443 in your NSG for portainer

4. If you get an error stating you need to restart container

```
sudo docker container restart <container-id>

```

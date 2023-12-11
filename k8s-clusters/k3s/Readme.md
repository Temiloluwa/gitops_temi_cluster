# K3S Cluster

# Setup

1. Node 1: Nginx LoadBalancer
2. Node 2: K3s Server
3. Node 3: K3S Agent

## Optional Nginx LoadBalancer

Nginx was installed following the guide [here](https://awswithatiq.com/how-to-install-nginx-in-amazon-linux-2023/).
To setup the conf file,
- I commented out most of the lines in the main config file at `/etc/nginx/nginx.conf`
- My domain name is `app.prod.hifeyinc.com`
- I created a new config file in the folder `/etc/nginx/conf.d` named `app.prod.hifeyinc.com.conf`
- Included the config file in the main config file at `/etc/nginx/nginx.conf`
- Finally installed ssl certifcate using `sudo certbot --nginx`

```bash
include /usr/share/nginx/modules/*.conf;
include /etc/nginx/conf.d/*.conf;

```

## K3s Server configuration

- Optionally disable firewalls with `sudo ufw disable`, then reboot on server and agent
```
# install server
curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="774" INSTALL_K3S_EXEC="server" K3S_TOKEN=12345  sh -s - 

# get server token
cat /var/lib/rancher/k3s/server/token

# install agent
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent --server https://<your-server-private-ip>:6443 --token <your-token>" sh -s -

# connect with kubectl and k9s by
    - use scp to copy kubeconfig to local
    - modify kubeconfig file to point to the pulic ip of the serve
    - set $KUBECONFIG environment variable before making calls with kubectl

```

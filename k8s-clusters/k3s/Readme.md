# K3S Cluster

# Setup

1. Node 1: Nginx LoadBalancer
2. Node 2: K3s Server
3. Node 3: K3S Agent

## Nginx LoadBalancer

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

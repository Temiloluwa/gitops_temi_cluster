# -- add repo
#helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
#helm repo update

# -- check versions
#helm search repo  ingress-nginx --versions

helm template ingress-nginx ingress-nginx \
    --repo https://kubernetes.github.io/ingress-nginx \
    --version 4.8.1 \
    --namespace ingress-nginx

#helm install ingress-nginx ingress-nginx/ingress-nginx \
#    --version 4.8.1 \
#    --namespace ingress-nginx \
#    --create-namespace 
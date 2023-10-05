helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm install ingress-nginx ingress-nginx/ingress-nginx \
    --version 4.8.1 \
    --namespace nginx-ingress-ctrl \
    --create-namespace 
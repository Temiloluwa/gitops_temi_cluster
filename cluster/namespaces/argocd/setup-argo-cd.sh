helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

kubectl create namespace argocd

helm install hifeyinc-argocd argo/argo-cd \
    --version 5.46.7 \
    --namespace argocd 

kubectl apply -f ./ingress.yaml -n argocd

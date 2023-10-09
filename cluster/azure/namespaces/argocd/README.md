# ArgoCD

Agro cd is installed with helm chart at `charts/argocd`

## Guide

### Configuration

Configurations are made by modifying values file

- ingress config are modified
- `server.insecure=true` to enable ssl termination at load balancer

### To Install

```bash
helm install hifeyinc-argocd charts/argo-cd --namespace argocd --dependency-update
```

### To get Initial Admin Secret

```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

```

### To Upgrade Installation

```bash
 helm upgrade --install hifeyinc-argocd cluster/namespaces/argocd/charts/argo-cd --namespace argocd --dependency-update
```

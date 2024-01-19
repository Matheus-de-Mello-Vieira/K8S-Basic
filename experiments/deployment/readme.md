Create infra

```bash
kubectl apply -f nginx-deployment.yaml 
```

To see deployments
```bash
kubectl get deployments
```

To see rollout status:
```bash
kubectl rollout status deployment/nginx-deployment
```

See nginx version
```bash
kubectl describe deployments
```

# Change version

```bash
kubectl set image deployment.v1.apps/nginx-deployment nginx=nginx:1.16.1
```

To see rollout status:
```bash
kubectl rollout status deployment/nginx-deployment
```

See nginx version
```bash
kubectl describe deployments
```

# Rollback

See history:
```bash
kubectl rollout history deployment/nginx-deployment
```

Rollback:
```bash
kubectl rollout undo deployment/nginx-deployment
```

See nginx version
```bash
kubectl describe deployments
```

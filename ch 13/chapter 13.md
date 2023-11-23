# ConfigMap
Create configmap
```bash
kubectl apply -f configmap/configmap.yaml
kubectl apply -f configmap/kuard-config.yaml
```

Acess the API
```bash
kubectl port-forward kuard-config 8080
```
1) see the tab "Server Env":
2) see the tab "File System" and go to `config/`

# Secrets

Download secrets
```bash
curl -o secrets/kuard.crt https://storage.googleapis.com/kuar-demo/kuard.crt
curl -o secrets/kuard.key https://storage.googleapis.com/kuar-demo/kuard.key
```

Create secret:
```bash
kubectl create secret generic kuard-tls \
    --from-file=secrets/kuard.crt \
    --from-file=secrets/kuard.key
```

Describe secret
```bash
kubectl describe secrets kuard-tls
```

Create POD that consumes secret
```bash
kubectl apply -f secrets/kuard-secret.yaml
```

Acess the API
```bash
kubectl port-forward kuard-tls 8080
```
see the tab "File System" and go to `tls/`, this volume exists only in RAM (tmpfs)

List
```bash
kubectl get secrets
```

List configmaps
```bash
kubectl get configmaps
```

Describe
```bash
kubectl describe configmap my-config
```


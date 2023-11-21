```bash
kubectl create -f init_deployments.yaml
```

```bash
kubectl get deployments kuard -o yaml > kuard-deployment.yaml
kubectl replace -f kuard-deployment.yaml --save-config
```

obs: You must delete resourceVersion and uid from the created file

```bash
kubectl apply -f kuard-deployment.yaml 
```

```bash

```

```bash

```
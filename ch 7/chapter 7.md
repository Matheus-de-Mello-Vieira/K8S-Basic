# Start Minikube
```bash
minikube start
```

# Creation
```bash
kubectl apply -f alpaca_pod.yaml
kubectl apply -f bandicoot_pod.yaml
kubectl apply -f bandicoot_service.yaml 
kubectl apply -f alpaca_service.yaml
```
# Query
see services from minikube
```bash
minikube service
```
se services from K8S
```bash
kubectl get services
```

get minikube IP
```bash
minikube ip
```

# Destroy

```bash
kubectl delete services,deployments --all
```

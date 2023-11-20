# Start Minikube
```bash
minikube start
```

# Creation
```bash
kubectl apply -f depedencies/contour.yaml
kubectl apply -f pods_services
kubectl apply -f ingress.yaml
```
obs.: `depedencies/contour.yaml` is from `https://projectcontour.io/quickstart/contour.yaml`

# Configuration
make tunnel with minikube to contour:
```bash
minikube tunnel
```

Get external-ip of contour:
```bash
kubectl -n projectcontour get po,svc
```

Update `/etc/hosts`, replacing `1.2.3.4` with the external-ip of contour
```bash
1.2.3.4 alpaca.example.local.com
1.2.3.4 bandicoot.example.local.com
1.2.3.4 other.example.local.com
```

# delete
```bash
kubectl delete services,pods,ingress --all
```
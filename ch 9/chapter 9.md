# Start Minikube
```bash
minikube start
```

# Creation
```bash
kubectl apply -f replica_set.yaml
```

# Query
Describe
```bash
kubectl describe rs kuard
```

See replica set from pod
```bash
kubectl get pods kuard-4g4w8 -o jsonpath='{.metadata.ownerReferences}'
```

See pods from replica set

```bash
kubectl get pods -l app=kuard,version=2
```

Scale manually
```bash
kubectl scale replicasets kuard --replicas=4
```

Autoscale
```bash
kubectl autoscale rs kuard --min=2 --max=5 --cpu-percent=8
```

# delete
Delete replica set and pods
```bash
kubectl delete rs kuard
```

Delete replica set without pods
```bash
kubectl delete rs kuard --cascade=false
```
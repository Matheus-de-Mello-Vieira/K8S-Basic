Start minikube with multiple nodes
```bash
minikube stop
minikube delete 
minikube start --nodes 2
```

Create infra

```bash
kubectl apply -f fluentd.yaml 
```

See one pod to each node:
```bash
kubectl get pods -o wide
```

Add a new node
```bash
minikube node add
```

See that k8s create a pod on the new node

# limiting daemonsets at especific nodes

Stop before sector:
```bash
kubectl delete -f fluentd.yaml
```

Get nodes
```bash
minikube node list
```

Add some label on one pod
```bash
kubectl label nodes minikube ssd=true
```

Create infra
```bash
kubectl apply -f nginx-fast-storage.yaml
```
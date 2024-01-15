```bash
minikube start
minikube addons enable metrics-server

docker build -t memory_consumer ./memory_consumer/
minikube image load memory_consumer --daemon=true

kubectl apply -f consumer_deployment.yaml 
kubectl apply -f service.yaml
kubectl apply -f autoscaling.yaml


```

```bash

minikube service --all

```


```bash
kubectl get hpa
```
# create PODs
kubectl apply -f alpaca_pod.yaml
kubectl apply -f bandicoot_pod.yaml
kubectl apply -f bandicoot_service.yaml 
kubectl apply -f alpaca_service.yaml 

# see services direct from minikube
minikube service

# see services from k8s
kubectl get services
minikube ip

# destroy
kubectl delete services,deployments --all
# start minikube
minikube start

# create infra
kubectl apply -f https://projectcontour.io/quickstart/contour.yaml
kubectl apply -f pods_services
kubectl apply -f ingress.yaml

# make external-ip
minikube tunnel

# See external-ip
kubectl -n projectcontour get po,svc

# update /etc/hosts
# replace <IP> with the external-ip

# 10.102.248.52 alpaca.example.local.com
# 10.102.248.52 bandicoot.example.local.com
# 10.102.248.52 other.example.local.com

# delete everthing
minikube delete
```bash
kubectl apply -f nfs-volume.yaml
kubectl apply -f nfs-volume-claim.yaml
kubectl apply -f mysql-replicaset.yaml
```

1) Connect to mysql
```bash
kubectl port-forward mysql-zcchb 3306
```

2) As url uses:
jdbc:mysql://localhost:3306/?allowPublicKeyRetrieval=true&useSSL=false

3) Create database

4) Delete pod
```bash
kubectl delete pods mysql-zcchb
```

5) See the created database at step 3

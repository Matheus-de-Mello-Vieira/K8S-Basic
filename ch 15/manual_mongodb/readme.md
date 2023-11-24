obs.: it uses mongo 3.4.1

Create infrastructure

```bash
kubectl apply -f mongo-simple.yaml
kubectl apply -f mongo-service.yaml
```

See DNS services of `mongo-service.yaml`

```bash
kubectl run -it --rm --image busybox buzybox ping mongo-1.mongo
```

Lets choose `mongo-0.mongo` as main replica
```bash
kubectl exec -it mongo-0 mongo
```

Execute:
```
rs.initiate({
    _id: "rs0",
    members: [ {_id: 0, host: "mongo-0.mongo:27017"} ]
});
rs.add("mongo-1.mongo:27017");
rs.add("mongo-2.mongo:27017");
```

# clean
```bash
kubectl delete pods,services --all
```


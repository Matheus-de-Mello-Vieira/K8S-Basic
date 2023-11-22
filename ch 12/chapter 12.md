Create infra:
```bash
kubectl apply -f job-oneshot.yaml
```

describe
```bash
kubectl describe jobs oneshot
```

get logs:
By job:
```bash
kubectl logs job.batch/oneshot
```

By pod:
```bash
kubectl logs oneshot-oneshot-w7vgk
```

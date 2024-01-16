# One shot
Create infra:
```bash
kubectl apply -f oneshot/job-oneshot.yaml
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

You can see when fail with the `oneshot/job-oneshot-failure1.yaml` (reset on failure) and `onesho/tjob-oneshot-failure2.yaml` (reset never)

# Parallelism
See `parallel/job-parallel.yaml`, it will execute the job `completions` times, with `parallelism` max parallel containers

# Task Queue

Create the queue
```bash
kubectl apply -f queue/rs-queue.yaml 
```

Make port forward with the queue. You will need the pod created on previous step:
```bash
kubectl port-forward queue-hprt4 8080:8080
```

Expose the that as service
```bash
kubectl apply -f queue/service-queue.yaml
```

Queue messages
```bash
sh queue/queue_producer.sh
```

Start consumers
```bash
kubectl apply -f queue/job-consumers.yaml
```

# CRON

Create infra
```bash
kubectl apply -f cron/cron-job.yaml
```

Describe by file
```bash
kubectl get -f cron/cron-job.yaml 
```

Describe
```bash
kubectl get cronjobs
```
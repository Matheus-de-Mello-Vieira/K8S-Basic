Create Elastic search service and pods

```bash
kubectl apply -f elasticsearch/elasticsearch_service.yaml 
kubectl apply -f elasticsearch/elasticsearch_statefulset.yaml
```

Create Kibana service and pods

```bash
kubectl apply -f kibana/kibana_service.yaml
kubectl apply -f kibana/kibana_deployment.yaml
```

Create Fluentd things

```bash
kubectl apply -f fluentd/fluentd_authentication.yaml
kubectl apply -f fluentd/fluentd_daemonset.yaml
```

Make some logs:

```bash
kubectl apply -f log_maker/job-parallel.yaml 
```

Go to elastic search th kibana and make de query:

```json
GET logstash-2024.01.16/_search?size=1000
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "kubernetes.container_name": {
              "value": "kuard"
            }
          }
        },
        {
          "exists": {
            "field": "log"
          }
        }
      ]
    }
  },
  "_source": ["log", "kubernetes.pod_name"]
}
```
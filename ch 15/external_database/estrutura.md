A ideia aqui é testar feature interessante


Um serviço `driver` vai enviar um request para um serviço `driven`

O serviço `driven` no namespace test seria um pod comum do kubenetes
O serviço `driven` no namespace prd seria um container externo (representa um serviço externo)

A referencia do serviço `driver` para o `driven` será o mesmo

Para isso, vamos começar criando os namespaces:
```bash
kubectl apply -f namespaces.yaml
```

# Driven
O driven é um simples servidor nginx, que retorna o valor da variavel de ambiente `SHOW_VALUE` na rota `/`

```bash
docker build --build-arg SHOW_VALUE=driven:test -t driven:test driven/
docker build --build-arg SHOW_VALUE=driven:prd -t driven:prd driven/
minikube image load driven:test
```

Deixe rodando o driven-prd:
```bash
docker container remove --force driven-prd
docker run --detach --name driven-prd -p 80:80 driven:prd
```

Vamos testar a url:
```bash
curl 127.0.0.1:80
```
se tudo der certo, vai retornar `driven:prd`

Rode o pod do driven também:
```bash
kubectl apply -f driven/driven-test-pod.yaml
```

Vamos testar a URL:
```bash
kubectl --namespace=test port-forward driven-test 8080:80
```
Em outro terminal:
```bash
curl 127.0.0.1:8080
```
se tudo der certo, vai retornar `driven:test`

Vamos criar os serviços

```bash
kubectl apply -f driven/driven-services.yaml
```

# Driver
O container só mostra o resultado de `curl driven` e termina

Constroi a imagem:
```bash
docker build -t driver driver/
minikube image load driver
```
Em caso de bug: https://minikube.sigs.k8s.io/docs/handbook/pushing/

```bash
kubectl apply -f driver/driver-jobs.yaml
```

Pegue os logs do job de test
```bash
kubectl --namespace=test describe jobs driver
kubectl --namespace=test logs container-id
```
Se tudo der certo, vai imprimir `driven:test`

Pegue os logs do job de production
```bash
kubectl --namespace=production describe jobs driver
kubectl --namespace=production logs container-id
```

Se tudo der certo, vai imprimir `driven:prd`
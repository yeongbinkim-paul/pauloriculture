---
title: "[Basic] Kubernetes Commands (KR)"
tags:
- Skill
- Basic
- Kubernetes
- KR
---
# OS
Mac OS Apple M1 Pro 13.4.1

# reference
https://kubernetes.io/docs/reference/kubectl/cheatsheet/

# install requirements
```
brew install kubectl
brew install helm
```

## for cluster
```
brew install kind
brew install minikube # you can choose one of them
```

# deploy cluster
## minikube
```
minikube start --cpus {n} --memory {m} # n = number of cores / m = size of memory (mb)
```

## kind
```
kind create cluster --image kindest/node:v1.21.1 # check version
```

# load local docker image to cluster
## minikube
```
minikube docker-env # To point your shell to minikube's docker-daemon, run:
eval $(minikube -p minikube docker-env) # from then, this shell can share the image you want
docker build {your_image} # execute on the same shell
minikube image ls --format table # check if the image is contained
```

## kind
```
kind load docker-image {your_image}
```

# kubectl
## create namespace
```
kubectl create namespace {your_namespace}
```

## move namespace
```
kubectl config use-context {your_namespace} # temporarily
kubectl config set-context --curent --namespace={your_namespace} # permanently
```

## create objects
```
kubectl apply -f {yaml_directory}
```

## get resource
```
kubectl get all # see all resources
kubectl get pod --sort-by=.metadata.name # pods / sort by name
kubectl get svc # services
kubectl get namespace
kubectl get deployment
kubectl get secret
```

## Describe commands with verbose output
```
kubectl describe pod {your_pod}
```

## get pod logs
```
kubectl logs {your_pod} -c {container_name} # with -c option, you can get logs of specific container.
```

## access into pod shell
```
kubectl exec -it {pod_name} -- /bin/bash # it can be /bin/sh
```

## port forwarding
```
kubectl port-forward svc/{service_name} {localhost_port}:{service_port} --namespace {your_namespace}
```

# helm chart
## create helm chart with template
```
helm create {app_name}
```

## helm lint before deployment
```
helm lint
```

## helm get yaml file
```
helm template {chart_directory} --debug # --debug option will show line number with error message if it doesn't work properly
```

## helm deploy chart
```
helm install {app_name} {chart_directory} --values {custom_values_file} --namespace {your_namespace} {--create-namespace} # deploy helm chart, --create-namespace option creates namespace if it doesn't exist
```

## helm upgrade chart
```
helm upgrade {app_name} {chart_directory} --values {custom_values_file} --namespace {your_namespace}
```

## helm delete chart
```
helm uninstall {app_name}
```

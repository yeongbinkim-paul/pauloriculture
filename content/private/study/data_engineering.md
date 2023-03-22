---
title: "Airflow"
tags:
- Airflow
- Kubernetes
---


## Airflow on Kubernetes 배포하기 (on M1 Mac)
- m1에 minikube 설치하기 [참조](https://velog.io/@pinion7/macOs-m1-%ED%99%98%EA%B2%BD%EC%97%90%EC%84%9C-kubernetes-%EC%8B%9C%EC%9E%91%ED%95%98%EA%B8%B0)
    ```shell
    $ curl -Lo minikube https://github.com/kubernetes/minikube/releases/download/v1.25.1/minikube-darwin-arm64 \
  && chmod +x minikube
    ```
    ```shell
    $ sudo install minikube /usr/local/bin/minikube
    ```
- heml, kubectl 설치하기
    ```shell
    $ brew install helm, kubectl
    ```
- minikube 시작
    ```shell
    $ minikube start --driver=docker
    ```
- helm repo 추가
    ```shell
    $ helm repo add apache-airflow https://airflow.apache.org
    $ helm repo update
    ```
- airflow chart 설치
    ```shell
    $ helm install $RELEASE_NAME apache-airflow/airflow --namespace $NAMESPACE --debug
    ```
- webserver port-forwarding
    ```shell
    $ kubectl port-forward svc/airflow-webserver 8080:8080 --namespace $NAMESPACE
    ```

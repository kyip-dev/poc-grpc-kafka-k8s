#!/bin/bash

kubectl delete --all services
kubectl delete --all deployments
kubectl delete --all pods

minikube stop
minikube start --kubernetes-version v1.5.3

kubectl create -f zookeeper.yaml
kubectl create -f kafka.yaml
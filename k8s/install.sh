#!/bin/bash

kubectl create -f zookeeper.yaml
kubectl create -f kafka.yaml
kubectl create -f application.yaml

kubectl port-forward testpod 8888:8888
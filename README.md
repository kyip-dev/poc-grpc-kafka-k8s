# poc-grpc-kafka-k8s

## Introduction
A poc to showing how applicaiton communicate from topdown using jupyter, golang, grpc and kafka. Entites:

  - kayiphk/golang-grpc-kafka
    - golang server that communicate with jupyter using grpc and send message to kafka
  - kayiphk/jupyter
    - [jupyter base-notebook] (https://hub.docker.com/r/jupyter/base-notebook) with grpc dependence installed
  - wurstmeister/kafka
  - wurstmeister/zookeeper

## Prerequisite

Before installing the services and deployments using kubectl, you need install below software.
Depending on your OS, you may have different docker installations.  If you are using linux, you need to further install kubeadm

* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [docker](https://docs.docker.com/docker-for-mac/install/)
* [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
* [Chrome](https://www.google.com/chrome/)

## Spin up the services

After cloning the project, update the applicaiton.yaml, update the volume path  (/Users/kayip/go/src/golang-grpc) to map to your folder path that contains the jupyter folder.

Then run install.sh
```sh
$ cd k8s
$ chmod +x install.sh
$ ./install.sh
```

## Run jupyter
port forward to map 127.0.0.1:8888 to access the pod
```sh
$ kubectl port-forward testpod 8888:8888
```

jupyter need access token to access, need check log to get the token
```sh
$ kubectl log testpod jupyter
```

You will see something like
>http://(testpod or 127.0.0.1):8888/?token=4deec1580aa00839b3877e65982a12692a8435b3d9044b0a

copy and paste to chrome browser
>http://127.0.0.1:8888/?token=4deec1580aa00839b3877e65982a12692a8435b3d9044b0a

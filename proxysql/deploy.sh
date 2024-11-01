#!/bin/bash

# config map
kubectl delete configmap proxysql > /dev/null 2>&1
kubectl create configmap proxysql

# services
kubectl apply -f proxysql.yaml

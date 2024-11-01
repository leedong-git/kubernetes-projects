#!/bin/bash

# configmap
kubectl delete configmap proxysql

# service
kubectl delete -f proxysql.yaml

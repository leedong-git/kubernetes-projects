#!/bin/bash

# namespace
kubectl create namespace db > /dev/null 2>&1

# services
kubectl apply -f ./redis.yaml --namespace=db

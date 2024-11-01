#!/bin/bash

# secret

# services
kubectl apply -f ./pvc.yaml --namespace=db
kubectl apply -f ./cm.yaml --namespace=db
kubectl apply -f ./postgresql.yaml --namespace=db

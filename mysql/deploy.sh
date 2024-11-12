#!/bin/bash

kubectl create secret generic mysql-password --from-literal=password=password123

# services
kubectl apply -f ./pvc.yaml
kubectl apply -f ./cm.yaml
kubectl apply -f ./mysql.yaml

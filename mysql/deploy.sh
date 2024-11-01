#!/bin/bash

# services
kubectl apply -f ./pvc.yaml
kubectl apply -f ./cm.yaml
kubectl apply -f ./mysql.yaml

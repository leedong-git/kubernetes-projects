#!/bin/bash

# service
kubectl delete -f ./postgresql.yaml --namespace=db
kubectl delete -f ./cm.yaml --namespace=db

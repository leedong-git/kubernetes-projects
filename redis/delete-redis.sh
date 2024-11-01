#!/bin/bash

# namespace
kubectl delete -f ./redis.yaml --namespace=db

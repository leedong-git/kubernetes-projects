#!/bin/bash
rdate -s time.bora.net
systemctl restart ntpd

./minikube stop
./minikube start --vm-driver=none
./minikube addons enable ingress
./minikube addons enable metrics-server
./minikube addons enable dashboard

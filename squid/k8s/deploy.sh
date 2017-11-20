#!/bin/bash
pushd ../conf
kubectl delete configmap/conf --namespace=elasticsearch > /dev/null
kubectl create configmap conf --from-file=oauth2_proxy.cfg --namespace=elasticsearch
popd
kubectl apply -f . --namespace=elasticsearch

#!/bin/bash
kubectl delete statefulset pgsql

kubectl get pvc -o name| while read claim 
do
kubectl delete $claim
done
kubectl delete pv cl-vol
kubectl delete service pgsqlsvc


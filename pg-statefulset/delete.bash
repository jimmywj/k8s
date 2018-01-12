#!/bin/bash
kubectl delete statefulset pgsql
kubectl delete pvc cl-vol-pgsql-0
kubectl delete pv cl-vol
kubectl delete service pgsql


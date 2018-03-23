#!/bin/bash

#gcloud container clusters create clcluster --num-nodes=3 --enable-kubernetes-alpha --cluster-version=1.9.4-gke.1
gcloud container clusters create clcluster --num-nodes=3 --cluster-version=1.9.4-gke.1

gcloud container get-server-config

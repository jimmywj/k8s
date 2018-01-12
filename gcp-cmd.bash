#!/bin/bash

gcloud container clusters create clcluster --num-nodes=1 --cluster-version=1.8.5-gke.0

gcloud container get-server-config

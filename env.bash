#!/bin/bash
gcloud config set project compleave
gcloud config set compute/zone asia-east1-b  

export PROJECT_ID="$(gcloud config get-value project -q)"

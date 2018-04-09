#!/bin/bash

az group create --name rg1 --location westeurope
az aks create --resource-group rg1 --name cs1 --node-count 2 --generate-ssh-keys

#!/bin/bash

az storage account create --resource-group MC_rg1_cs1_westeurope --name jimappstorageaccount --location westeurope --sku Standard_LRS

current_env_conn_string=`az storage account show-connection-string -n jimappstorageaccount -g MC_rg1_cs1_westeurope --query 'connectionString' -o tsv`

if [[ $current_env_conn_string == "" ]]; then  
  echo "Couldn't retrieve the connection string."
else
  az storage share create --name azurefile --quota 20 --connection-string "$current_env_conn_string"
fi


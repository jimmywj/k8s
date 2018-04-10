az disk create \
  --resource-group MC_rg1_cs1_westeurope \
  --name azureDisk  \
  --size-gb 20 \
  --query id --output tsv
  --sku Standard_LRS

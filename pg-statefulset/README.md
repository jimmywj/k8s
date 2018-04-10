Postgres database on kubernetes and gcp
=======================================


This example use gcedisk as storage to create statefulset with replica=1.

Usage
 * Run create-gce-disk.sh to create gce disk with 8G size or create-azure-disk.sh to create azure disk
 * Run kubectl create -f pg.1.9.yaml or kubectl create -f pg.1.9.azure.pv.disk.yaml in azure (require kubectl >= 1.9) 
 * Run delete.bash to delete all services, statefulset, persistent volume and claim.
 * Run kubectl create -f phppgadmin.1.9.yaml to create an optional web php service to access the postgres database


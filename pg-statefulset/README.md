Postgres database on kubernetes and gcp
=======================================


This example use gcedisk as storage to create statefulset with replica=1.

Usage
 * Run create-gce-disk.sh to create gce disk with 5G size
 * Run kubectl create -f pg.xml  
 * Run delete.bash to delete all services, statefulset, persistent volume and claim.
 * Run kubectl create -f phppgadmin.yaml to create an optional web php service to access the postgres database


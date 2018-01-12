# This directory is the create the postgres database on kubernetes and gcp.
# 
# This example use gcedisk as storage to create statefulset with replica=1.
# * Run create-gce-disk.sh to create gce disk with 5G size
# * Run kubectl create -f pg.xml  
# * Run delete.bash to delete all services, statefulset, persistent volume and claim.
#

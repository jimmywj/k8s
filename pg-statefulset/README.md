Postgres database on kubernetes and gcp
=======================================

This example use gcedisk or azuredisk as storage to create statefulset with replica=1.

### Usage

 * Run create-gce-disk.sh to create gce disk with 8G size or create-azure-disk.sh to create azure disk
 * Run kubectl create -f pg.1.9.yaml or kubectl create -f pg.1.9.azure.pv.disk.yaml in azure (require kubectl >= 1.9) 
 * Run delete.bash to delete all services, statefulset, persistent volume and claim.
 * Run kubectl create -f phppgadmin.1.9.yaml to create an optional web php service to access the postgres database

### Namespace
Kubernetes support namespace which you can deploy same copy of yaml to same cluster/nodes with different virtual network. (https://kubernetes.io/docs/tasks/administer-cluster/namespaces/)
The default namespace is default.

You can create namespace with kubectl create -f namespace.yaml (dev and prod)
Then, you can use the following commands to assign the cluster to the name space, this example assign dev and prod namespace to same cluster

    kubectl config set-context dev --namespace=development --cluster=cs1 --user=clusterUser_rg1_cs1
    kubectl config set-context prod --namespace=production --cluster=cs1 --user=clusterUser_rg1_cs1

You can use kubectl config use-context dev to change the namespace. You may see something like below with kubectl get pods --all-namespaces which 3 deployments as different environment.

Please note that some warning of PV already exist will be prompted. Please ignore this.  On the other hand, same disk image are used as volume, with 8G claim, the first two deployments will copy the images and attached to the pod as volume as they are separate volume.  For the last pod, which the disk is not enough the host the PV, therefore azure will dynamic provision a disk with 8G and attached to the pod.  Since it is dynamically created, the postgres will have empty data on it.

```
NAMESPACE     NAME                                    READY     STATUS    RESTARTS   AGE
default       pgsql-0                                 1/1       Running   0          4h
default       phppgadmin-7797845f94-gnblq             1/1       Running   0          4h
development   pgsql-0                                 1/1       Running   0          3h
development   phppgadmin-7797845f94-drfwx             1/1       Running   0          3h
kube-system   heapster-6599f48877-xm6zw               2/2       Running   0          1d
kube-system   kube-dns-v20-7c556f89c5-kmptl           3/3       Running   0          1d
kube-system   kube-dns-v20-7c556f89c5-nbrg5           3/3       Running   0          1d
kube-system   kube-proxy-grvrq                        1/1       Running   2          1d
kube-system   kube-proxy-q8gd5                        1/1       Running   0          1d
kube-system   kube-svc-redirect-rff82                 1/1       Running   2          1d
kube-system   kube-svc-redirect-tfvts                 1/1       Running   0          1d
kube-system   kubernetes-dashboard-546f987686-5zrdj   1/1       Running   0          1d
kube-system   tunnelfront-66788b49f7-b82pm            1/1       Running   0          1d
production    pgsql-0                                 1/1       Running   0          36m
production    phppgadmin-7797845f94-p7bps             1/1       Running   0          36m
```

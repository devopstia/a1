## Reference
- [How to setup NFS Server on Ubuntu 21.04](https://www.youtube.com/watch?v=ajnaF0Awdzk)


## Install and configure the nfs server
```sh
sudo apt update
sudo apt install nfs-kernel-server -y
systemctl status nfs-kernel-server
systemctl enable nfs-kernel-server
mkdir /nfsshare
chmod 777 -R /nfsshare
```
## Configure the exports on the client machine
1. Open the exports file
vim /etc/exports

2. add the share directory. PS * means any IP. We can also add the IP address of the target machine
```sh
/nfsshare *(rw,sync,no_subtree_check)
```

3. Restart the NFS server
```sh
systemctl restart nfs-kernel-server
```

```sh
# /etc/exports: the access control list for filesystems which may be exported
#               to NFS clients.  See exports(5).
#
# Example for NFSv2 and NFSv3:
# /srv/homes       hostname1(rw,sync,no_subtree_check) hostname2(ro,sync,no_subtree_check)
/nfsshare *(rw,sync,no_subtree_check)
# Example for NFSv4:
# /srv/nfs4        gss/krb5i(rw,sync,fsid=0,crossmnt,no_subtree_check)
# /srv/nfs4/homes  gss/krb5i(rw,sync,no_subtree_check)
#
```

```sh
# /etc/exports: the access control list for filesystems which may be exported
#               to NFS clients.  See exports(5).
#
# Example for NFSv2 and NFSv3:
# /srv/homes       hostname1(rw,sync,no_subtree_check) hostname2(ro,sync,no_subtree_check)
/nfsshare 3.91.5.245(rw,sync,no_subtree_check)
/nfsshare 3.91.5.225(rw,sync,no_subtree_check)
/nfsshare 3.91.5.247(rw,sync,no_subtree_check)
# Example for NFSv4:
# /srv/nfs4        gss/krb5i(rw,sync,fsid=0,crossmnt,no_subtree_check)
# /srv/nfs4/homes  gss/krb5i(rw,sync,no_subtree_check)
#
```

## Configure the client machine
`54.147.55.174` = NFS server IP
```sh
sudo apt update
sudo apt install nfs-common -y
mkdir /nfs
mount 54.147.55.174:/nfsshare /nfs

## add the below line in /etc/fstab
54.147.55.174:/nfsshare  /nfs    nfs     defaults        0       0

mount -a
```
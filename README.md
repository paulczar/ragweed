# Ragweed is set of example Planfiles for running Heroku (Cedar) buildpacks in Habitat.

Heroku Cedar buildpacks use hints found in your git repo to work out what to do. 
 
Normally the cedar stack would autodetect your language and build out your system deps etc,
to do that here would require a lot of space and create large .hart files, so we'll assume
you know what language you have and just deal with your language deps.



## example usage:

```
root@hab-dev:/# hab pkg export docker paulczar/ragweed-nodejs 
   hab-studio: Creating Studio at /tmp/hab-pkg-dockerize-CnzQ/rootfs (baseimage)
» Installing paulczar/ragweed-nodejs
↓ Downloading core/acl/2.2.52/20160612075215
    181.20 KB / 181.20 KB - [====================================================================================] 100.00 % 3.13 MB/s  ↓ Downloading core-20160612031944 public origin key
    75 B / 75 B | [==============================================================================================] 100.00 % 5.54 MB/s  ☑ Cached core-20160612031944 public origin key
✓ Installed core/acl/2.2.52/20160612075215
...
...
★ Install of core/hab-sup complete with 12 packages installed.
» Symlinking hab from core/hab into /tmp/hab-pkg-dockerize-CnzQ/rootfs/hab/bin
★ Binary hab from core/hab/0.8.0/20160708161531 symlinked to /tmp/hab-pkg-dockerize-CnzQ/rootfs/hab/bin/hab
» Symlinking bash from core/busybox-static into /tmp/hab-pkg-dockerize-CnzQ/rootfs/bin
★ Binary bash from core/busybox-static/1.24.2/20160708162350 symlinked to /tmp/hab-pkg-dockerize-CnzQ/rootfs/bin/bash
» Symlinking sh from core/busybox-static into /tmp/hab-pkg-dockerize-CnzQ/rootfs/bin
★ Binary sh from core/busybox-static/1.24.2/20160708162350 symlinked to /tmp/hab-pkg-dockerize-CnzQ/rootfs/bin/sh
Sending build context to Docker daemon 315.5 MB
Step 1 : FROM scratch
 ---> 
...
...
Step 8 : CMD start paulczar/ragweed-nodejs
 ---> Running in 858cfb9d29ae
 ---> 241d98732511
Removing intermediate container 858cfb9d29ae
Successfully built 241d98732511

docker run -d --name node -e POWERED_BY=HABITAT paulczar/ragweed-nodejs
95e67cccb8980c3ebc24625998da054d65d0e82887b4f251ba7f1e4237bc193e
root@hab-dev:/# docker inspect node | grep IPA
            "SecondaryIPAddresses": null,
            "IPAddress": "172.17.0.4",
                    "IPAMConfig": null,
                    "IPAddress": "172.17.0.4",
root@hab-dev:/# curl 172.17.0.4:5000
Powered by HABITAT

```

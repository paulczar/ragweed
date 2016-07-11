# Example heroku style nodejs app

## run example app:

```
$ hab pkg export docker paulczar/ragweed-nodejs 
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

$ docker run -d --name node -e POWERED_BY=HABITAT paulczar/ragweed-nodejs
95e67cccb8980c3ebc24625998da054d65d0e82887b4f251ba7f1e4237bc193e
$ docker inspect node | grep IPA
            "SecondaryIPAddresses": null,
            "IPAddress": "172.17.0.4",
                    "IPAMConfig": null,
                    "IPAddress": "172.17.0.4",
$ curl 172.17.0.4:5000
Powered by HABITAT

```

## Run your own app:

If you insert your own app into /app usign a volume mount ( or in a Dockerfile ) then
it will try to build your deps before running:

```
$ hab pkg export docker paulczar/ragweed-nodejs
$ docker run -v $(pwd):/app -ti paulczar/ragweed-nodejs
hab-sup(MN): Starting paulczar/ragweed-nodejs
hab-sup(GS): Supervisor 172.17.0.5: e232acd1-4db9-4cb7-b804-ac40f867d18f
hab-sup(GS): Census ragweed-nodejs.default: af7ca93b-865e-465f-96c5-27e83dcd79ca
hab-sup(GS): Starting inbound gossip listener
hab-sup(GS): Starting outbound gossip distributor
hab-sup(GS): Starting gossip failure detector
hab-sup(CN): Starting census health adjuster
init(PH): express@4.13.4 node_modules/express
init(PH): ��������� escape-html@1.0.3
init(PH): ��������� array-flatten@1.1.1
init(PH): ��������� cookie-signature@1.0.6
init(PH): ��������� utils-merge@1.0.0
init(PH): ��������� content-type@1.0.2
init(PH): ��������� merge-descriptors@1.0.1
...
...
ragweed-nodejs(SV): Starting
ragweed-nodejs(O): Running node server.js
ragweed-nodejs(O): Server listening on port 5000 in development mode

``

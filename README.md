docker-openwrt-sdk
========================
[![License: MIT](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/hnw/docker-openwrt-sdk/blob/master/LICENSE)


This is a docker container for the [OpenWRT](https://openwrt.org/) [SDK](https://wiki.openwrt.org/doc/howto/obtain.firmware.sdk).

Because the build system requires that its command are not executed by root,
the user `openwrt` was created. The buildroot can be found in
`/home/openwrt/openwrt`.

To run a shell in the buildroot, execute the following command:

```sh
$ docker run -i -t yhnw/openwrt-sdk sudo -i -u openwrt bash
```

Then you can build packages as follows:

```sh
$ cd openwrt
$ ./scripts/feeds update -a
$ ./scripts/feeds install php5
$ make package/php5/compile V=s
$ ls bin/ar71xx/packages/packages
```

More information on how to use this buildroot can be found on the
[OpenWRT wiki](http://wiki.openwrt.org/doc/howto/build).

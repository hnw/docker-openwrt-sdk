docker-openwrt-sdk
========================
[![License: MIT](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/hnw/docker-openwrt-sdk/blob/master/LICENSE)


This is a docker container for the [OpenWRT](https://openwrt.org/) / [LEDE](https://www.lede-project.org/) SDK.

Because the build system requires that its command are not executed by root,
the user `openwrt` was created. The buildroot can be found in
`/home/openwrt/sdk`.

To run a shell in the buildroot, execute the following command:

```sh
$ docker run -i -t -u openwrt -w /home/openwrt/sdk -v $PWD:/work yhnw/openwrt-sdk:15.05.1-ar71xx /bin/bash
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


## See also

- [Using the SDK](https://wiki.openwrt.org/doc/howto/obtain.firmware.sdk)

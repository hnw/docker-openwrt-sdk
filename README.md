docker-openwrt-sdk
========================
[![License: MIT](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/hnw/docker-openwrt-sdk/blob/master/LICENSE)


This is a docker container for the [OpenWRT](https://openwrt.org/) / [LEDE](https://www.lede-project.org/) SDK.

To run a shell as `openwrt` user in the SDK container, execute the following command:

```sh
$ docker run -i -t -u openwrt -w /home/openwrt/sdk -v $PWD:/work yhnw/openwrt-sdk:17.01-ar71xx /bin/bash
```

Then you can build packages as follows:

```sh
$ ./scripts/feeds update -a
$ ./scripts/feeds install php7
$ make package/php7/compile V=s
$ ls -la bin/packages/mips_24kc/packages/php7-cli*
-rw-r--r-- 1 openwrt openwrt 1457137 Sep 19 06:30 bin/packages/mips_24kc/packages/php7-cli_7.1.1-1_mips_24kc.ipk
```

More information on how to use the SDK tool-chain can be found on the
[OpenWRT wiki](http://wiki.openwrt.org/doc/howto/build).

## See also

- [Using the SDK](https://wiki.openwrt.org/doc/howto/obtain.firmware.sdk) OpenWrt Wiki
- [Using the SDK](https://lede-project.org/docs/guide-developer/compile_packages_for_lede_with_the_sdk) LEDE docs

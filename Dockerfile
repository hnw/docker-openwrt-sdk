FROM ubuntu:xenial

ENV SDK_URL "https://downloads.openwrt.org/chaos_calmer/15.05.1/ar71xx/generic/OpenWrt-SDK-15.05.1-ar71xx-generic_gcc-4.8-linaro_uClibc-0.9.33.2.Linux-x86_64.tar.bz2
ENV SDK_SUFFIX .tar.bz2

RUN apt-get update &&\
    apt-get install -y git-core subversion wget bzip2 unzip \
                       gcc g++ make ccache zlib1g-dev \
                       python gawk sudo groff-base &&\
    apt-get clean &&\
    useradd -m openwrt &&\
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt &&\
    sudo -iu openwrt wget $SDK_URL &&\
    sudo -iu openwrt tar xjf "$(basename $SDK_URL)" &&\
    sudo -iu openwrt rm "$(basename $SDK_URL)" &&\
    sudo -iu openwrt mv "$(basename $SDK_URL $SDK_SUFFIX)" openwrt &&\
    sudo -iu openwrt openwrt/scripts/feeds update -a &&\
    sudo -iu openwrt ln -s ../feeds/base/package/utils openwrt/package/utils
# see: https://dev.openwrt.org/ticket/18552

#!/bin/sh

echo cd $HOME
cd $HOME

wget -nv https://storage.googleapis.com/golang/go1.4-bootstrap-20170531.tar.gz
wget -nv https://storage.googleapis.com/golang/go1.8.3.src.tar.gz
wget -nv https://gist.github.com/hnw/cd8a29642b74c881bbc357332664597c/raw/1576409ffa4313d498f3b1f008b4895129002889/go1.8.3sf.diff

tar xzf go1.4-bootstrap-20170531.tar.gz
mv go go1.4-bootstrap-20170531
cd go1.4-bootstrap-20170531/src
./make.bash
rm /tmp/make.bash.log
cd ../..

tar xzf go1.8.3.src.tar.gz
mv go go1.8.3-mips32-softfloat-patch
cd go1.8.3-mips32-softfloat-patch
patch -p1 < ../go1.8.3sf.diff
cd src
GOROOT_BOOTSTRAP=$(pwd)/../../go1.4-bootstrap-20170531 ./all.bash
rm /tmp/all.bash.log
cd ../..

rm go1.4-bootstrap-20170531.tar.gz go1.8.3.src.tar.gz go1.8.3sf.diff
rm -rf go1.4-bootstrap-20170531
